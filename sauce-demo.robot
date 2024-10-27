*** Settings ***
Documentation    This test suit tests Sauce Demo application.
Library    Browser


#TODO:test tags

*** Variables ***
#Settings Variables
${BROWSER}    chromium
${HEADLESS}    false

#Test Data
${STANDART_USER}    standard_user
${PASSWORD}    secret_sauce
${WRONG_PASSWORD}    wrong_password
${FIRSTNAME}    Giovana
${LASTNAME}    Silva
${ZIPCODE}    80200-100

#Elements
${Login_Username}    //input[@id="user-name"]
${Login_Password}    //input[@id="password"]
${Login_Button}    //input[@id="login-button"]
${Auth_Error}    //button[@class="error-button"]
${Inventory_First_Item}    (//div[@class="inventory_item"])[1]
${Shopping_Cart}    //div[@id="shopping_cart_container"]
${Checkout_Button}    //button[@id="checkout"]
${Input_FirstName}    //input[@id="first-name"]
${Input_LastName}    //input[@id="last-name"]
${PostalCode}    //input[@id="postal-code"]
${Information_Submit}    //input[@id="continue"]
${Finish}    //button[@id="finish"]
${Checkout_Container}    //div[@id="checkout_complete_container"]

*** Test Cases ***
Log into Sauce Demo and buy one item
    [Documentation]    This test case open Sauce Demo, adds the first inventory list item into cart and check-out the item.
    Given Sauce Demo is open
    And I login into system    ${STANDART_USER}    ${PASSWORD}
    When I add 1 item to the cart
    And I checkout the item
    And I fill the buyer information    ${FIRSTNAME}    ${LASTNAME}
    And I finish the checkout process 
    Then I see a confirmation message
    And end test

Try to log into Sauce Demo with invalid credentials
    [Documentation]    This test case open Sauce Demo, try to login with invalid credentials.
    Given Sauce Demo is open
    When I login into system    ${STANDART_USER}    ${WRONG_PASSWORD}
    Then I see an error messsage
    And end test

# TODO:Remove item from cart

# TODO:Buy the cheapest item

# TODO:Logout

*** Keywords ***
Sauce Demo is open
    New Browser    browser=${BROWSER}    headless=${HEADLESS}
    New Context    locale=en-GB
    New Page    https://www.saucedemo.com/ 

I login into system
    [Arguments]    ${user}    ${password}
    Fill Text    ${Login_Username}   ${user}
    Fill Text    ${Login_Password}    ${password}
    Click    ${Login_Button}


I add 1 item to the cart
    
    Click    ${Inventory_First_Item}  
    #TODO:data-test verificar se o carrinho está com 1 item

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

#TODO:check if the item is the same
    Click    ${Finish}


I see a confirmation message
    Focus    ${Checkout_Container}

I see an error messsage
    Focus    ${Auth_Error}

end test
    Close Context
    Close Browser