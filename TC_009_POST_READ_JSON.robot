*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
Resource    Resources/UserKeywords.robot
*** Variables ***
${base_url}=    https://thetestingworldapi.com/
*** Test Cases ***
TC_009_Create_New-Resources
    Create Session    AddData    ${base_url}
    ${header}=    Create Dictionary    Content-Type=application/json
    ${jsoncontent}=    Fetch Request Content
    Log To Console    ${jsoncontent}
    ${response}=    Post Request    AddData    api/studentsDetails  headers=${header}  data=${jsoncontent}
    Log To Console    ${response.content}
    Log To Console    ${response.status_code}
    Should Be Equal As Numbers    ${response.status_code}   201

