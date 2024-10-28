*** Settings ***
Documentation    This test suit tests Sauce Demo application.
Library    Browser
Resource    ../Resources/Common/Steps/common.robot
Resource    ../Resources/Login/Steps/login.robot
Resource    ../Resources/Logout/Steps/logout.robot
Resource    ../Resources/Cart/Steps/add_to_cart.robot
Resource    ../Resources/Cart/Steps/checkout.robot
Variables    ../Tests/common/WEB/data.py


*** Test Cases ***
Log into Sauce Demo and buy one item
    [Documentation]    This test case open Sauce Demo, logs in, adds the Sauce Labs Backpack into cart and checkout the item.
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

Logout
    [Documentation]    This test case open Sauce Demo, logs in and then logs out.
    Given Sauce Demo is open
    And I login into system    ${STANDART_USER}    ${PASSWORD}
    When I logout
    Then I see the login page
    And end test
