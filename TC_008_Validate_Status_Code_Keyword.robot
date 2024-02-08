*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
Resource    Resources/UserKeywords.robot
*** Test Cases ***
TC_008_FETCH_STUDENT_DETAILS_BY_ID
    Fetch And Validate Get Status Code    10065158      200
    ${response}=    Fetch And Return Get Responnse     10065158 
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}

    ${response1}=    Fetch And Return Get Responnse     10065153
    Log To Console    ${response1.status_code}
    Log To Console    ${response1.content}
