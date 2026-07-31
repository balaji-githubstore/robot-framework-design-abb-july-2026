*** Settings ***
Documentation    Test Suite validates all invalid login scenario 

Resource    ../../../Resource/UI/CommonFunctionalities.resource
Resource    ../../../Resource/UI/Pages/LoginPage.resource

Test Setup    Launch Browser And Navigate To Url
Test Teardown    Close Browser

*** Test Cases ***
TC1 Invalid Login
    [Template]    Invalid Login Template
    john    john1332    Invalid username or password

TC2 Empty Username Login
    [Template]    Invalid Login Template
    ${EMPTY}    john1332    Invalid username or password



*** Keywords ***
Invalid Login Template
    [Arguments]    ${username}    ${password}    ${expected_error}
    Enter Username    ${username} 
    Enter Password    ${password} 
    Click Login
    Validate Invalid Error Message    ${expected_error}
    
