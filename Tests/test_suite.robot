*** Settings ***
Library     Process
Library     OperatingSystem
# Library     PandasLibrary
Library     DateTime
Library     calculatrice.py

*** Variables ***
@{numbers}   10  20  100  200
${N}  100


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
    Run Process       python    factoriel 200
    ${end_time}=      Get Current Date    result_format=epoch
    ${elapsed_time}=  Evaluate  ${end_time} - ${start_time}
    Log               Temps d'exécution du script: ${elapsed_time} secondes
    Should Be True    ${elapsed_time} < 1

Test de performance 2
    [Documentation]    Vérifier que la fonction retourne un résultat dans un délai raisonnable pour des valeurs élevées
    FOR    ${number}    IN    @{numbers}
        ${start_time}=    Get Current Date    result_format=epoch
        FOR  ${test}   IN RANGE  ${N}
            Run Process   python    factoriel  ${number}
        END
        ${end_time}=      Get Current Date    result_format=epoch
        ${elapsed_time}=  Evaluate  ${end_time} - ${start_time}
        Log   Temps d'exécution du script: ${elapsed_time} secondes
    END


Test de limites
    [Documentation]    Test pour vérifier les valeurs proches des limites pratiques
    ${result}=    factoriel    100
    Should Be Equal As Strings   ${result}    93326215443944152681699238856266700490715968264381621468592963895217599993229915608941463976156518286253697920827223758251185210916864000000000000000000000000

Test d'erreurs
    [Documentation]    Test pour vérifier le calcul avec des valeurs négatives
    ${result}=    factoriel    -5
    Should Contain     ${result}    factoriel existe pas pour un nombre negatif

Test de robustesse
    [Documentation]    Test pour vérifier le calcul avec des valeurs non entières
    ${result}=    factoriel    5.2
    Should Contain     ${result}    Factoriel existe pas pour un réel
