*** Settings ***
Library     Process
Library     Extract_data.py
Library     OperatingSystem
Library     pandasLibrar
Library     autre_calculatrice.py
Library     calculatrice.py


*** Variables ***
${EXPECTED_OUTPUT1}    25
${EXPECTED_OUTPUT2}    120
${num1}    10
${num2}    15
${n}    5

@{COMMAND}    python    autre_calculatrice.py    ${num1}    ${num2}

*** Test Cases ***
Comparer deux valeurs avec argument
    [Documentation]    Test de la fonction addition avec arguments
    ${result}=    Run Process    @{COMMAND}
    Should Contain    ${result.stdout}    The sum of ${num1} and ${num2} is ${EXPECTED_OUTPUT1}

Comparer deux valeurs sans argument
    [Documentation]    Test de la fonction addition sans arguments
    ${result} =     addition    ${num1}    ${num2}
    Should Be Equal As Numbers    ${result}    ${EXPECTED_OUTPUT1}

Comparer factorielle
    [Documentation]    Test de la fonction factorielle
    ${result} =     factoriel    ${n}
    Should Be Equal As Numbers    ${result}    ${EXPECTED_OUTPUT2}