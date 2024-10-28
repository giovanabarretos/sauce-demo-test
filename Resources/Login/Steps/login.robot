*** Settings ***
Library   Browser
Variables    ../locators.py

*** Keywords ***
I login into system
    [Arguments]    ${user}    ${password}
    Fill Text    ${Login_Username}   ${user}
    Fill Text    ${Login_Password}    ${password}
    Click    ${Login_Button}

I see an error messsage
    Focus    ${Auth_Error}
    