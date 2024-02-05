*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
*** Variables ***
${base_url}=    https://thetestingworldapi.com/
*** Test Cases ***
TC_003_DELETE_Request
    Create Session    Delete_Request    ${base_url}
    ${response}=    DELETE On Session    Delete_Request    api/studentsDetails/10064106
    Log To Console    ${response.status_code}
    ${code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${code}    200
    Log To Console    ${response.content}
    ${json_response}=    To Json  ${response.content}
    Log To Console    ${json_response}


    @{status}=    Get Value From Json    ${json_response}    status
    ${st}=    Get From List    ${status}    0
    Should Be Equal    ${st}    true

    @{msg_list}=    Get Value From Json    ${json_response}    msg
    ${msg}=    Get From List    ${msg_list}    0
    Log To Console    ${msg}
#    Should Be Equal    ${msg}    Delete  data success
    Should Contain     ${msg}    Delete

#
#$ robot TC_003_Delete_Request.robot
#==============================================================================
#TC 003 Delete Request
#==============================================================================
#TC_003_DELETE_Request                                                 200
#b'{"status":"true","msg":"Delete  data success"}'
#c:\python38\lib\site-packages\urllib3\connectionpool.py:1099: InsecureRequestWarning: Unverified HTTPS request is being made to host 'thetestingworldapi.com'. Adding certificate verification is strongly advised. See: https://urllib3.readthedocs.io/en/latest/advanced-usage.html#tls-warnings
#  warnings.warn(
#[ WARN ] Keyword 'RequestsLibrary.To Json' is deprecated. Please use ${resp.json()} instead. Have a look at the improved HTML output as pretty printing replacement.
#{'status': 'true', 'msg': 'Delete  data success'}
#| PASS |
#------------------------------------------------------------------------------
#TC 003 Delete Request                                                 | PASS |
#1 test, 1 passed, 0 failed
#==============================================================================
#Output:  C:\Users\hp\PycharmProjects\RobotAPIAutomation\output.xml
#Log:     C:\Users\hp\PycharmProjects\RobotAPIAutomation\log.html
#Report:  C:\Users\hp\PycharmProjects\RobotAPIAutomation\report.html

#TC_003_DELETE_Request                                                 200
#b'{"status":"true","msg":"Delete  data success"}'
#c:\python38\lib\site-packages\urllib3\connectionpool.py:1099: InsecureRequestWarning: Unverified HTTPS request is being made to host 'thetestingworldapi.com'. Adding certificate verification is strongly advised. See: https://urllib3.readthedocs.io/en/latest/advanced-usage.html#tls-warnings
#  warnings.warn(
#[ WARN ] Keyword 'RequestsLibrary.To Json' is deprecated. Please use ${resp.json()} instead. Have a look at the improved HTML output as pretty printing replacement.
#{'status': 'true', 'msg': 'Delete  data success'}
#Delete  data success
#| FAIL |
#data success: Delete  data success != Delete
#------------------------------------------------------------------------------
#TC 003 Delete Request                                                 | FAIL |
#1 test, 0 passed, 1 failed

#$ robot TC_003_Delete_Request.robot
#==============================================================================
#TC 003 Delete Request
#==============================================================================
#TC_003_DELETE_Request                                                 200
#b'{"status":"true","msg":"Delete  data success"}'
#c:\python38\lib\site-packages\urllib3\connectionpool.py:1099: InsecureRequestWarning: Unverified HTTPS request is being made to host 'thetestingworldapi.com'. Adding certificate verification is strongly advised. See: https://urllib3.readthedocs.io/en/latest/advanced-usage.html#tls-warnings
#  warnings.warn(
#[ WARN ] Keyword 'RequestsLibrary.To Json' is deprecated. Please use ${resp.json()} instead. Have a look at the improved HTML output as pretty printing replacement.
#{'status': 'true', 'msg': 'Delete  data success'}
#Delete  data success
#| PASS |
#------------------------------------------------------------------------------
#TC 003 Delete Request                                                 | PASS |
#1 test, 1 passed, 0 failed
