*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
*** Variables ***
${base_url}    https://thetestingworldapi.com/
${original_first_name}    Hello
${update_first_name}    Abhimanyu
*** Test Cases ***
TC_007_END_TO_END
    Create Session    End_To_End    ${base_url}
    &{header}=    Create Dictionary    Content-Type=application/json
    &{body}=    Create Dictionary    first_name=${original_first_name}  middle_name=A  last_name=Kumar  date_of_birth=12/12/1997
    ${post_response}=    Post Request    End_To_End    api/studentsDetails    headers=${header}    data=${body}
    ${json_response}=    To Json    ${post_response.content}
    @{id_list}=    Get Value From Json    ${json_response}    id
    Log To Console    ${id_list}
    ${id}=    Get From List    ${id_list}    0
    Log To Console    ${id}
    
    &{body}=    Create Dictionary    id=${id}  first_name=${update_first_name}  middle_name=Gauranga  last_name=Kumar  date_of_birth=16/12/1997
    ${put_response}=    Put Request    End_To_End    api/studentsDetails/${id}    headers=${header}    data=${body}
    Log To Console    ${put_response.content}
    Log To Console    ${put_response.status_code}
    
    Fetch Details and Validate  ${id}
    
    
    
    ${delete_response}=    Delete Request   End_To_End  api/studentsDetails/${id}
    Log To Console    ${delete_response.status_code}
    Log To Console    ${delete_response.content}
    ${json_delete}=    To Json  ${delete_response.content}
    @{Message}=    Get Value From Json    ${json_delete}    status 
    ${statusM}=  get from list   ${Message}   0
    Should Be Equal    ${statusM}    true
    
*** Keywords ***
Fetch Details and Validate
    [Arguments]    ${studentId}
    ${get_request}=    Get Request    End_To_End  api/studentsDetails/${studentId}
    ${json_response}=    To Json    ${get_request.content}
    @{Lfirst_name}=    Get Value From Json    ${json_response}    data.first_name
    ${first_name}=    Get From List    ${Lfirst_name}    0
    Should Be Equal    ${first_name}    ${update_first_name}

    