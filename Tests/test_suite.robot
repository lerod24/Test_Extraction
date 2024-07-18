*** Settings ***
Library  OperatingSystem
Resource  resources/keywords.robot

*** Variables ***
${APP_PATH}  ../Extract_data.py

*** Test Cases ***
Test Launch Application
    [Documentation]    Teste le lancement de l'application
    [Tags]             Smoke
    Start Application

Test Application Functionality
    [Documentation]    Teste une fonctionnalité de l'application
    [Tags]             Functional
    # Ajouter ici les mots-clés pour tester les fonctionnalités spécifiques
