*** Settings ***
Documentation    This test suit tests a Fake REST API
Library    RequestsLibrary
Library    Collections
Resource    ../Resources/API/Steps/check-api.robot
Variables    ../Tests/common/API/data.py

*** Test Cases ***

Check all activities ID fields
    [Documentation]    This test case access the API, get all activities and checks if any id field is empty
    Get all activities and check ID fields

Get activity by ID
    [Documentation]    This test case access the API and get one activity using its id
    Get activity using ID    ${ID}

Create new activity
    [Documentation]    This test case access the API and create a new activity
    Create activity    ${ID}    ${TITLE}    ${DUEDATE}    ${COMPLETED}

Delete activity by ID
    [Documentation]    This test case access the API and delete one activity using its id
    Delete activity using ID    ${ID}

