*** Settings ***
Library   Browser
Variables    ../locators.py

*** Keywords ***
I checkout the item
    Click    ${Shopping_Cart}
    Click    ${Checkout_Button}

I fill the buyer information
    [Arguments]    ${firstname}    ${lastname}
    Fill Text    ${Input_FirstName}   ${firstname}
    Fill Text    ${Input_LastName}   ${lastname}
    Fill Text    ${PostalCode}    ${ZIPCODE}
    Click    ${Information_Submit} 

I finish the checkout process 
    Click    ${Finish}

I see a confirmation message
    Focus    ${Checkout_Container}