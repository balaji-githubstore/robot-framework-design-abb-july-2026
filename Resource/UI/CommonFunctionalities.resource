*** Settings ***
Documentation    Manages all the common functionalities such as browser, report, customized keyword
...    to support web ui automation 

Library    SeleniumLibrary    

Variables    ../../Configuration/timeout-config.yaml

*** Variables ***
${BROWSER}    chrome
${URL}    https://demo.openemr.io/b/openemr/

*** Keywords ***
Launch Browser And Navigate To Url 
    [Documentation]    Use this keyword to launch browser and navigate to url \n
    ...    Examples: \n
    ...    | Launch Browser And Navigate To Url |
    Open Browser    browser=${BROWSER}
    Maximize Browser Window
    Set Selenium Implicit Wait    ${medium_timeout}s
    Set Selenium Timeout    ${default_timeout}s
    Go To    url=${URL}

Click Interactable Element 
    [Documentation]    Use this keyword to click on interactable element \n\n
    ...    Examples: \n
    ...    | Click Interactable Element | xpath=//input[@value='submit'] | 30s | 
    [Arguments]    ${locator}    ${timeout}=${default_timeout}s
    Wait Until Page Contains Element    ${locator}    ${timeout}
    Wait Until Element Is Visible    ${locator}    ${timeout}
    Wait Until Element Is Enabled    ${locator}    ${timeout}
    Click Element    ${locator} 

Click Until Element Succeed
    [Documentation]    Use this keyword to click on element until it succeed \n\n
    ...    Examples: \n
    ...    | Click Until Element Succeed | xpath=//input[@value='submit'] | 30s | 0.5s |
     ...    | Click Until Element Succeed | xpath=//input[@value='submit'] | 
    [Arguments]    ${locator}     ${retry}=${default_timeout}s    ${retry_interval}=${small_retry_interval}
    Wait Until Keyword Succeeds    ${retry}    ${retry_interval}    Click Element     ${locator} 

Input Text To Element
    [Arguments]    ${locator}    ${text}    ${timeout}=${default_timeout}s
    Wait Until Page Contains Element    ${locator}    ${timeout}
    Wait Until Element Is Visible    ${locator}    ${timeout}
    Wait Until Element Is Enabled    ${locator}     ${timeout}   
    Input Text    ${locator}    ${text}


