*** Settings ***
Library   Browser
Variables    ../locators.py

*** Keywords ***
I add 1 item to the cart
    Click    ${Inventory_First_Item}