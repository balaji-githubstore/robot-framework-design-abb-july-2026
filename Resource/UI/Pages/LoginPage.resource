*** Settings ***
Documentation    This resource handles all the elements on the login page 

Resource    ../CommonFunctionalities.resource

*** Variables ***
${USERNAME_LOCATOR}    css=#authUser
${PASSWORD_LOCATOR}    css=#clearPass
${LANGUAGE_LOCATOR}    xpath=//select[@name='languageChoice']
${LOGIN_LOCATOR}    id=login-button
${ACKNOWLEDGEMENT_LOCATOR}    partial link=Acknowledgments
${LOGIN_HEADER_LOCATOR}     xpath=//p[contains(text(),'popular')]
${INVALID_LOGIN_LOCATOR}    xpath=//p[contains(text(),'Invalid')] 

*** Keywords ***
Enter Username
    [Arguments]    ${username}
    Input Text To Element   locator=${USERNAME_LOCATOR}    text=${username}

Enter Password 
    [Arguments]    ${password}
    Input Text To Element    locator=${PASSWORD_LOCATOR}    text=${password}

Click Login
    Click Interactable Element    locator=${LOGIN_LOCATOR}

Validate Invalid Error Message
    [Arguments]    ${expected_text}
    Element Text Should Be    locator=${INVALID_LOGIN_LOCATOR}    expected=${expected_text}

Validate Title Of LoginPage
    [Arguments]    ${expected_title}
    Title Should Be    ${expected_title}

    