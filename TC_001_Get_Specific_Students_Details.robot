*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
*** Variables ***
${APP_BASE_URL}        https://thetestingworldapi.com/
${StudentID}    10058032
*** Test Cases ***
TC_001_Fetch_Specific_Students_Details_By_Id
    Create Session    Fetch_Data    ${APP_BASE_URL}
    ${Response}=    GET On Session    Fetch_Data    api/studentsDetails/${StudentID}
    Log To Console    ${Response.status_code}
    Log To Console    ${Response.content}
    ${actual_code}=    Convert To String    ${Response.status_code}
    Should Be Equal    ${actual_code}    200

    ${json_res}=    To Json    ${Response.content}
    
    @{first_name_list}=    Get Value From Json    ${json_res}    data.first_name
    ${first_name}=    Get From List    ${first_name_list}    0
    Log To Console    ${first_name}
    Should Be Equal    ${first_name}    sanem
    
    @{last_name_list}    Get Value From Json    ${json_res}    data.last_name
    ${last_name}=    Get From List    ${last_name_list}    0
    Log To Console    ${last_name}
    Should Be Equal    ${last_name}    deneme4
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


#$ robot TC_001_Get_Specific_Students_Details.robot
#==============================================================================
#TC 001 Get Specific Students Details
#==============================================================================
#TC_001_Fetch_Specific_Students_Details_By_Id                          200
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
