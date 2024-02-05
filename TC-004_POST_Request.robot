*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
*** Variables ***
${base_url}    https://thetestingworldapi.com/
*** Test Cases ***
TC_004_ADD_NEW_RESOURCE_POST_REQUEST
    Create Session    ADD_NEW_STUDENT        ${base_url}
    &{header}=    Create Dictionary    Content-Type=application/json
    &{body}=  Create Dictionary    first_name=Abhimanyu  middle_name=Hare  last_name=Kumar  date_of_birth=12/12/2000 
    ${response}=    Post Request  ADD_NEW_STUDENT    api/studentsDetails  data=${body}  headers=${header}
    Log To Console    ${response.status_code}
    Should Be Equal As Numbers    ${response.status_code}    201
    Log To Console    ${response.content}


#    $ robot TC-004_POST_Request.robot
#==============================================================================
#TC-004 POST Request
#==============================================================================
#TC_004_ADD_NEW_RESOURCE_POST_REQUEST                                  [ WARN ] Keyword 'RequestsLibrary.Post Request' is deprecated. Please use `POST On Session` instead.
#201
#b'{"id":10064178,"first_name":"Abhimanyu","middle_name":"Hare","last_name":"Kumar","date_of_birth":"12/12/2000"}'
#| PASS |
#------------------------------------------------------------------------------
#TC-004 POST Request                                                   | PASS |
#1 test, 1 passed, 0 failed
#==============================================================================
#Output:  C:\Users\hp\PycharmProjects\RobotAPIAutomation\output.xml
#Log:     C:\Users\hp\PycharmProjects\RobotAPIAutomation\log.html
#Report:  C:\Users\hp\PycharmProjects\RobotAPIAutomation\report.html
#c:\python38\lib\site-packages\urllib3\connectionpool.py:1099: InsecureRequestWarning: Unverified HTTPS request is being made to host 'thetestingworldapi.com'. Adding certificate verification is strongly advised. See: https://urllib3.readthedocs.io/en/latest/advanced-usage.html#tls-warnings
#  warnings.warn(

        
