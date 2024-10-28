*** Settings ***
Documentation    This test suit tests a Fake REST API
Library    RequestsLibrary
Library    Collections
Resource    ../Resources/API/Steps/check-api.robot
Variables    ../Tests/common/data.py

*** Test Cases ***

Access the Activities API
    Access API and check ID field

