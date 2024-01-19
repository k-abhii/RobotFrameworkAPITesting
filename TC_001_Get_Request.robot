*** Settings ***
Library    RequestsLibrary

*** Variables ***
${API_BASE_URL}    https://thetestingworldapi.com/


*** Test Cases ***
TC_001_GET_Request
    Create Session    GET_STUDENT_DETAILS    ${API_BASE_URL}
    ${response}=    Get Request    GET_STUDENT_DETAILS        api/studentsDetails
    Log To Console    ${response}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}

*** Keywords ***

