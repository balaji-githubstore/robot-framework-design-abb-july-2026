*** Settings ***
Documentation    Test Suite validates all valid login scenario 

Resource    ../../../Resource/UI/CommonFunctionalities.resource
Resource    ../../../Resource/UI/Pages/LoginPage.resource
Resource    ../../../Resource/UI/Pages/MainPage.resource

Test Setup    Launch Browser And Navigate To Url
Test Teardown    Close Browser

Test Template    Valid Login Template


*** Test Cases ***
TC1
    admin    pass    OpenEMR

# TC2
#     accountant    accountant    OpenEMR
    
# TC3
#     physician    physician    OpenEMR

*** Keywords ***
Valid Login Template
    [Arguments]    ${username}    ${password}    ${expected_title}
    Enter Username    ${username} 
    Enter Password    ${password} 
    Click Login
    Validate Title Of MainPage    ${expected_title}
