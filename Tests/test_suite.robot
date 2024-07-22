*** Settings ***
Library     Process
Library     OperatingSystem
Library     pandasLibrary
Library     DateTime
Library     calculatrice.py



*** Test Cases ***
Factorielle de Zero
    [Documentation]    verifier factorielle de 0
    ${result}=    factoriel    0
    Should Be Equal As Numbers    ${result}    1

Factorielle de un
    [Documentation]    test pour verifier factorielle de 1
    ${result}=    factoriel    1
    Should Be Equal As Numbers    ${result}    1

Factorielle de cinq
    [Documentation]    Test pour vérifier des petites valeurs
    ${result}=    factoriel    5
    Should Be Equal As Numbers    ${result}    120

Factorielle d'un valeur moyenne
    [Documentation]    Test pour vérifier la fonction pour des valeurs moyennes
    ${result}=    factoriel    10
    Should Be Equal As Numbers    ${result}    3628800

Test de performance
    [Documentation]    Vérifier que la fonction retourne un résultat dans un délai raisonnable pour des valeurs élevées
    ${start_time}=    Get Current Date    result_format=epoch
    Run Process       python    .\calculatrice.py
    ${end_time}=      Get Current Date    result_format=epoch
    ${elapsed_time}=  Evaluate  ${end_time} - ${start_time}
    Log               Temps d'exécution du script: ${elapsed_time} secondes
    Should Be True    ${elapsed_time} < 1


Test de limites
    [Documentation]    Test pour vérifier les valeurs proches des limites pratiques
    ${result}=    factoriel    100
    Should Be Equal As Numbers   ${result}    93326215443944152681699238856266700490715968264381621468592963895217599993229915608941463976156518286253697920827223758251185210916864000000000000000000000000

Test d'erreurs
    [Documentation]    Test pour vérifier le calcul avec des valeurs négatives
    ${result}=    factoriel    -5
    Should Contain     ${result}    factoriel n'existe pas pour un nombre negatif

Test de robustesse
    [Documentation]    Test pour vérifier le calcul avec des valeurs non entières
    Run Keyword And Expect Error    ValueError: Argument 'n' got value 'factoriel n'existe pas pour un réel' that cannot be converted to integer.    Factoriel    factoriel n'existe pas pour un réel
