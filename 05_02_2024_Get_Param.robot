*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
*** Variables ***
${base_url}    https://reqres.in
*** Test Cases ***
5TH_February_TC_002_Get_Request_Param
    Create Session    Get_Param    ${base_url}
    &{param}=    Create Dictionary    page=2
    ${response}=  GET On Session    Get_Param    /api/users    params=${param}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    ${json_res}=    To Json    ${response.content}
    @{first_name_list}=    Get Value From Json    ${json_res}    data[0].first_name
    ${first_name}=    Get From List    ${first_name_list}    0
    Should Be Equal    ${first_name}    Michael
    
    ${response_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${response_code}    200

    
