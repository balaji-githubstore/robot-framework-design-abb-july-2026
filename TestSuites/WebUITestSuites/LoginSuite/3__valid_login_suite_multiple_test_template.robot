*** Settings ***
Documentation    Test Suite validates all valid login scenario 

Resource    ../../../Resource/UI/CommonFunctionalities.resource

Test Setup    Launch Browser And Navigate To Url
Test Teardown    Close Browser

# Test Template    Valid Login Template


*** Test Cases ***
TC1
    [Template]    Valid Login Template
    admin    pass    OpenEMR

TC2
    [Template]    Valid Login Template
    accountant    accountant    OpenEMR
    
TC3
    [Template]    Valid Login Template
    physician    physician    OpenEMR

TC4 
    [Template]    None
    [Setup]    None
    Log To Console    hello
    [Teardown]    None

TC5 
    [Setup]    None
    [Template]    Print Name Template
    bala
    [Teardown]    None

*** Keywords ***
Valid Login Template
    [Arguments]    ${username}    ${password}    ${expected_title}
    Input Text    id=authUser    ${username}
    Input Password    id=clearPass    ${password}
    Click Element    id=login-button
    Wait Until Page Contains     Calendar    timeout=30s
    Title Should Be    ${expected_title}


Print Name Template
    [Arguments]    ${name} 
    Log To Console    ${name} 