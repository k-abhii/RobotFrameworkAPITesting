*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
*** Variables ***
${base_url}    https://thetestingworldapi.com/
*** Test Cases ***
TC_005_UPDATE_RESOURCE_PUT_REQUEST
    Create Session    Update_Resource    ${base_url}
    &{body}=  Create Dictionary        id=10064178  first_name=Abhimanyu  middle_name=Krishna  last_name=Kumar  date_of_birth=16/02/1999
    &{header}=  Create Dictionary    Content-Type=application/json
    ${res}=    Put Request    Update_Resource  api/studentsDetails/10064178  data=${body}  headers=${header}
    Log To Console    ${res.status_code}
    Log To Console    ${res.content}
    Should Be Equal As Numbers    ${res.status_code}    200
    ${json_response}=    To Json    ${res.content}
    @{ST}=    Get Value From Json    ${json_response}    status
    ${status}=  Get From List   ${ST}    0
    Should Be Equal    ${status}  true
    
    ${response}=    Get Request    Update_Resource    api/studentsDetails/10064178
    Log To Console    ${response.content}

    ${json_res}=    To Json    ${response.content}
    @{middle_name_list}=    Get Value From Json    ${json_res}  data.middle_name
    ${m_n}=    Get From List    ${middle_name_list}    0
    Should Be Equal    ${m_n}    Krishna


  
