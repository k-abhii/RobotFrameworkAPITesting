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


