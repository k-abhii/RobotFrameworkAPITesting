*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
Resource    Resources/UserKeywords.robot
*** Test Cases ***
TC_008_FETCH_STUDENT_DETAILS_BY_ID
    Fetch And Validate Get Status Code    10065158      200
