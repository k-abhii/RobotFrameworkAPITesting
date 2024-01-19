*** Settings ***
Library    RequestsLibrary
*** Variables ***
${APP_BASE_URL}        https://thetestingworldapi.com/
${StudentID}    10058032
*** Test Cases ***
TC_001_Fetch_Specific_Students_Details_By_Id
    Create Session    Fetch_Data    ${APP_BASE_URL}
    ${Response}=    Get Request    Fetch_Data    api/studentsDetails/${StudentID}
    Log To Console    ${Response.status_code}
    Log To Console    ${Response.content}
    ${actual_code}=    Convert To String    ${Response.status_code}
    Should Be Equal    ${actual_code}    200

#$ robot TC_001_Get_Specific_Students_Details.robot
#==============================================================================
#TC 001 Get Specific Students Details
#==============================================================================
#TC_001_Fetch_Specific_Students_Details_By_Id                          [ WARN ] Keyword 'RequestsLibrary.Get Request' is deprecated. Please use `GET On Session` instead.
#200
#b'{"status":"true","data":{"id":10058032,"first_name":"sanem","middle_name":"deneme3 ","last_name":"deneme4","date_of_birth":"11-12-2000"}}'
#| PASS |
#------------------------------------------------------------------------------
#TC 001 Get Specific Students Details                                  | PASS |
#1 test, 1 passed, 0 failed
#==============================================================================
#Output:  C:\Users\hp\PycharmProjects\RobotAPIAutomation\output.xml
#Log:     C:\Users\hp\PycharmProjects\RobotAPIAutomation\log.html
#Report:  C:\Users\hp\PycharmProjects\RobotAPIAutomation\report.html
#c:\python38\lib\site-packages\urllib3\connectionpool.py:1099: InsecureRequestWarning: Unverified HTTPS request is being made to host 'thetestingworldapi.com'. Adding certificate verification is strongly advised. See: https://urllib3.readthedocs.io/en/latest/advanced-usage.html#tls-warnings
#  warnings.warn(
