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
    
    ${get_response}=    Get Request    E2E  api/studentsDetails/${id}
    Log To Console    ${get_response.content}
    ${get_json}=    To Json  ${get_response.content}  
    @{name_list}=  Get Value From Json    ${get_json}  data.first_name
    ${first_name}=  Get From List    ${name_list}  0
    Should Be Equal    ${first_name}    Abhimanyu

    @{m_name_list}=  Get Value From Json    ${get_json}  data.middle_name
    ${middle_name}=  Get From List    ${m_name_list}  0
    Should Be Equal    ${middle_name}    Gauranga

     @{l_name_list}=  Get Value From Json    ${get_json}  data.last_name
    ${last_name}=  Get From List    ${l_name_list}  0
    Should Be Equal    ${last_name}    Kumar



#    $ robot TC_006_E2E.robot
#==============================================================================
#TC 006 E2E
#==============================================================================
#TC_006_End_To_End_Test_Case                                           [ WARN ] Keyword 'RequestsLibrary.Post Request' is deprecated. Please use `POST On Session` instead.
#201
#b'{"id":10064753,"first_name":"Hello","middle_name":"Hare_Krishna","last_name":"Kumar","date_of_birth":"12/12/1997"}'
#c:\python38\lib\site-packages\urllib3\connectionpool.py:1099: InsecureRequestWarning: Unverified HTTPS request is being made to host 'thetestingworldapi.com'. Adding certificate verification is strongly advised. See: https://urllib3.readthedocs.io/en/latest/advanced-usage.html#tls-warnings
#  warnings.warn(
#[ WARN ] Keyword 'RequestsLibrary.To Json' is deprecated. Please use ${resp.json()} instead. Have a look at the improved HTML output as pretty printing replacement.
#10064753
#[ WARN ] Keyword 'RequestsLibrary.Put Request' is deprecated. Please use `PUT On Session` instead.
#200
#b'{"status":"true","msg":"update  data success"}'
#c:\python38\lib\site-packages\urllib3\connectionpool.py:1099: InsecureRequestWarning: Unverified HTTPS request is being made to host 'thetestingworldapi.com'. Adding certificate verification is strongly advised. See: https://urllib3.readthedocs.io/en/latest/advanced-usage.html#tls-warnings
#  warnings.warn(
#[ WARN ] Keyword 'RequestsLibrary.To Json' is deprecated. Please use ${resp.json()} instead. Have a look at the improved HTML output as pretty printing replacement.
#[ WARN ] Keyword 'RequestsLibrary.Get Request' is deprecated. Please use `GET On Session` instead.
#b'{"status":"true","data":{"id":10064753,"first_name":"Abhimanyu","middle_name":"Gauranga","last_name":"Kumar","date_of_birth":"16/02/1997"}}'
#c:\python38\lib\site-packages\urllib3\connectionpool.py:1099: InsecureRequestWarning: Unverified HTTPS request is being made to host 'thetestingworldapi.com'. Adding certificate verification is strongly advised. See: https://urllib3.readthedocs.io/en/latest/advanced-usage.html#tls-warnings
#  warnings.warn(
#[ WARN ] Keyword 'RequestsLibrary.To Json' is deprecated. Please use ${resp.json()} instead. Have a look at the improved HTML output as pretty printing replacement.
#| PASS |
#------------------------------------------------------------------------------
#TC 006 E2E                                                            | PASS |
#1 test, 1 passed, 0 failed
#==============================================================================
#Output:  C:\Users\hp\PycharmProjects\RobotAPIAutomation\output.xml
#Log:     C:\Users\hp\PycharmProjects\RobotAPIAutomation\log.html
#Report:  C:\Users\hp\PycharmProjects\RobotAPIAutomation\report.html


      


