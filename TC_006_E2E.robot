*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections

*** Variables ***
${base_url}    https://thetestingworldapi.com/
${original_first_name}    Hello
${update_first_name}    Abhimanyu

*** Test Cases ***
TC_006_End_To_End_Test_Case
    Create Session    E2E        ${base_url}
    &{header}=    Create Dictionary    Content-Type=application/json
    &{body}=    Create Dictionary    first_name=${original_first_name}  middle_name=Hare_Krishna  last_name=Kumar  date_of_birth=12/12/1997
    ${post_res}=    Post Request  E2E  api/studentsDetails    headers=${header}  data=${body}
    Log To Console    ${post_res.status_code}
    Log To Console    ${post_res.content}
    ${json_resp}=    To Json    ${post_res.content}  
    @{id_list}=    Get Value From Json     ${json_resp}    id 
    ${id}=    Get From List    ${id_list}    0
    Log To Console    ${id}
    ${put_body}=    Create Dictionary    id=${id}  first_name=${update_first_name}  middle_name=Gauranga  last_name=Kumar  date_of_birth=16/02/1997
    ${put_resp}=    Put Request    E2E  api/studentsDetails/${id}  headers=${header}  data=${put_body}
    Log To Console    ${put_resp.status_code}
    Log To Console    ${put_resp.content}
    Should Be Equal As Numbers   ${put_resp.status_code}    200
    ${put_resp_json}=        To Json    ${put_resp.content}    
    @{status_list}=    Get Value From Json  ${put_resp_json}  status 
    ${status}=  Get From List    ${status_list}    0
    Should Be Equal    ${status}    true


      


