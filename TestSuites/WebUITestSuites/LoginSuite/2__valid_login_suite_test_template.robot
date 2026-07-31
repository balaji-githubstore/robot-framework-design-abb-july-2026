*** Settings ***
Documentation    Test Suite validates all valid login scenario 

Resource    ../../../Resource/UI/CommonFunctionalities.resource

Test Setup    Launch Browser And Navigate To Url
Test Teardown    Close Browser

Test Template    Valid Login Template


*** Test Cases ***
TC1
    admin    pass    OpenEMR

TC2
    accountant    accountant    OpenEMR
    
TC3
    physician    physician    OpenEMR

*** Keywords ***
Valid Login Template
    [Arguments]    ${username}    ${password}    ${expected_title}
    Input Text    id=authUser    ${username}
    Input Password    id=clearPass    ${password}
    Click Element    id=login-button
    Wait Until Page Contains     Calendar    timeout=30s
    Title Should Be    ${expected_title}
    
    