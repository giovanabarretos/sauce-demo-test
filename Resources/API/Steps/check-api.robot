*** Settings ***
Library    Collections

*** Keywords ***
Get all activities and check ID fields
    ${body}    Create Dictionary
    ${response}    GET    ${URL_API}   ${body}
    Status Should Be    200
    
    FOR  ${id}  IN  @{response.json()}
        IF  ${id}[id] == None
            Fail
            Exit For Loop
        END   
    END

Get activity using ID
    [Arguments]    ${id}
    ${body}    Create Dictionary 
    ${response}    GET    ${URL_API}/${id}   ${body}
    Status Should Be    200

Create activity
    [Arguments]    ${id}    ${title}    ${duedate}    ${completed} 
    ${body}    Create Dictionary    ${id}    ${title}    ${duedate}    ${completed}    
    ${response}    post    ${URL_API}    json=${body}
    Status Should Be    200

Delete activity using ID
    [Arguments]    ${id}
    ${body}    Create Dictionary
    ${response}    delete    ${URL_API}/${id}    json=${body}
    Status Should Be    200
    
