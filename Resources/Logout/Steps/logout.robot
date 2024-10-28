*** Settings ***
Library   Browser
Variables    ../locators.py

*** Keywords ***
I logout
    Click    ${Menu_Button}
    Click    ${Logout_Button}

I see the login page
    Focus    ${Login_Button}