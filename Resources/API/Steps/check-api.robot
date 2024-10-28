*** Settings ***
Library    Collections

*** Keywords ***
Access API and check ID field
     ${body}    Create Dictionary
    ${response}    GET    ${URL_API}   ${body}
    Status Should Be    200
    
    FOR  ${id}  IN  @{response.json()}
        Exit For Loop If    ${id}[id] == None
        
    END

