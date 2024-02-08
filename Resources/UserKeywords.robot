*** Settings ***
Library        RequestsLibrary
Library    JSONLibrary
Library    Collections
*** Variables ***
${base_url}=   https://thetestingworldapi.com/
*** Keywords ***
Fetch and Validate Get Status Code
    [Arguments]    ${studentsId}    ${expectedStatusCode}
    Create Session    SName    ${base_url}
    ${response}=    Get Request    SName    api/studentsDetails/${studentsId}
    ${statusC}=    Convert To String    ${response.status_code}
    Should Be Equal    ${statusC}   ${expectedStatusCode}
Fetch and return Get Responnse
    [Arguments]    ${studentsId}
    Create Session    SName    ${base_url}
    ${response}=    Get Request    SName    api/studentsDetails/${studentsId}
    [Return]    ${response}

    
    
    
