*** Settings ***
Documentation    Handles all common elements like menu, profile section 

Resource    ../CommonFunctionalities.resource

*** Variables ***
${PATIENT_MENU_LOCATOR}    xpath=//div[normalize-space()='Patient']
${NEWSEARCH_MENU_LOCATOR}    xpath=//div[normalize-space()='New/Search']

*** Keywords ***
Click Patient Menu
    Click Interactable Element    locator=${PATIENT_MENU_LOCATOR}

Click NEWSEARCH Menu
    Click Interactable Element    locator=${NEWSEARCH_MENU_LOCATOR}

Validate Title Of MainPage
    [Arguments]    ${expected_title}
    Wait Until Page Contains Element    ${PATIENT_MENU_LOCATOR}
    Title Should Be    ${expected_title}
