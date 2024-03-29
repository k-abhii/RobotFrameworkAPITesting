*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
*** Variables ***
${base_url}    https://reqres.in
*** Test Cases ***
TC_002 Validate Get Request With Parameters
    Create Session    Get_Param    ${base_url}
    &{param}=    Create Dictionary    page=2
    ${response}=    GET On Session    Get_Param    /api/users    params=${param}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    
    ${actual_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${actual_code}    200
    
    Log To Console    ${response.text}
    
    ${res_json}=    Convert String To Json    ${response.text}
    Log To Console    ${res_json}
    @{first_name_list}=    Get Value From Json    ${res_json}    data[0].first_name
    ${first_name}=    Get From List    ${first_name_list}    0
    Should Be Equal    ${first_name}    Michael
    
    
    @{last_name_list}=    Get Value From Json    ${res_json}    data[0].last_name
    ${last_name}=    Get From List    ${last_name_list}    0
    Should Be Equal    ${last_name}    Lawson
    