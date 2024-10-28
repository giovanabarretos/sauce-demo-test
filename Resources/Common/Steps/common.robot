*** Settings ***
Library   Browser
Variables    ../locators.py

*** Keywords ***
Sauce Demo is open
    New Browser    browser=${BROWSER}    headless=${HEADLESS}
    New Context    locale=en-GB
    New Page    ${URL}


end test
    Close Context
    Close Browser