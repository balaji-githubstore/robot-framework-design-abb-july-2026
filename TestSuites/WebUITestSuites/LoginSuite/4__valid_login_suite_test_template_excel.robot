*** Settings ***
Documentation    Test Suite validates all valid login scenario 

Resource    ../../../Resource/UI/CommonFunctionalities.resource

Library    DataDriver   file=../../../Data/open-emr-data.xlsx    sheet_name=ValidLoginData

Test Setup    Launch Browser And Navigate To Url
Test Teardown    Close Browser

Test Template    Valid Login Template


*** Test Cases ***
TC_Valid_Login_${testcase}


*** Keywords ***
Valid Login Template
    [Arguments]    ${username}    ${password}    ${expected_title}
    Input Text    id=authUser    ${username}
    Input Password    id=clearPass    ${password}
    Click Element    id=login-button
    Wait Until Page Contains     Calendar    timeout=30s
    Title Should Be    ${expected_title}
