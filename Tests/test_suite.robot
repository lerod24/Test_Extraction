*** Settings ***
Library    Process

*** Variables ***
${COMMAND}    python Extract_data.py
${EXPECTED_OUTPUT}    expected output text

*** Test Cases ***
Extraire Données Financières
    [Documentation]    Test case pour extraire des données financières et les sauvegarder dans un fichier Excel
    ${result}    Run Process    ${COMMAND}
    Log    ${result.stdout}
    Should Contain    ${result.stdout}    ${EXPECTED_OUTPUT}
