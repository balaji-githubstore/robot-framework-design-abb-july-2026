*** Settings ***
Documentation    Test Suite validates all scenario while adding patient

Resource    ../../../Resource/UI/CommonFunctionalities.resource
Resource    ../../../Resource/UI/Pages/LoginPage.resource
Resource    ../../../Resource/UI/Pages/MainPage.resource

Test Setup    Launch Browser And Navigate To Url
Test Teardown    Close Browser


*** Test Cases ***
Verify Adding Valid Patient To The System
    Enter Username    admin 
    Enter Password    pass
    Click Login
    Click Patient Menu
    Click NEWSEARCH Menu
    Select Frame    xpath=//iframe[@name='pat']
    Input Text    xpath=//input[@id='form_fname']    john
    Input Text    xpath=//input[@id='form_lname']    wick
    Select From List By Label    xpath=//select[@id='form_sex']    Female
    Input Text    xpath=//input[@id='form_DOB']    2026-07-30
    Click Element    id=create
    Unselect Frame
    Select Frame    xpath=//iframe[@id='modalframe']
    Click Element    id=confirmCreate
    Unselect Frame
    Sleep    2s