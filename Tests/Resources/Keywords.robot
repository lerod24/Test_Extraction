*** Keywords ***
Start Application
    Run Process    python    ${APP_PATH}
    Process Should Be Running    python

Stop Application
    Terminate Process    python
