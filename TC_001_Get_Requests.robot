*** Settings ***
Library    RequestsLibrary


*** Variables ***
${API_URL}    "https://thetestingworldapi.com"


*** Test Cases ***
TC_001_Get_Requests
    ${url}=  Set Variable    Hello World
    Log To Console    ${API_URL}
    Log To Console    ${url}



*** Keywords ***



#https://github.com/k-abhii/RobotFrameworkAPITesting.git

#git remote add origin https://github.com/k-abhii/RobotFrameworkAPITesting.git
#git branch -M main
#git push -u origin main

#$ robot TC_001_Get_Requests.robot
#==============================================================================
#TC 001 Get Requests
#==============================================================================
#TC_001_Get_Requests                                                   "https://thetestingworldapi.com"
#Hello World
#| PASS |
#------------------------------------------------------------------------------
#TC 001 Get Requests                                                   | PASS |
#1 test, 1 passed, 0 failed
#==============================================================================
#Output:  C:\Users\hp\PycharmProjects\RobotAPIAutomation\output.xml
#Log:     C:\Users\hp\PycharmProjects\RobotAPIAutomation\log.html
#Report:  C:\Users\hp\PycharmProjects\RobotAPIAutomation\report.html
