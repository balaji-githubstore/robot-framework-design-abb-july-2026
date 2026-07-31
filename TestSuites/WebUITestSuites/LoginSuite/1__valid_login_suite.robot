*** Settings ***
Documentation    Test Suite validates all valid login scenario 

Resource    ../../../Resource/UI/CommonFunctionalities.resource

Test Setup    Launch Browser And Navigate To Url
Test Teardown    Close Browser

*** Test Cases ***
Verify Valid Login Test
    Input Text    id=authUser    physician
    Input Password    id=clearPass    physician
    Click Element    id=login-button
    Title Should Be    OpenEMR