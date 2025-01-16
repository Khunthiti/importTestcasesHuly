*** Settings ***
Library             SeleniumLibrary
*** Keywords ***
Wait until element is ready then click element
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds    5x    2s    Click Element    ${locator}

Sleep for Login
    Sleep     30

Sleep for contain element
    Sleep    5

Input the data for create test cases
    [Arguments]     ${testcase_topic}    ${testcase_precondition}    ${testcase_steps}    ${testcase_expected}

Wait until element is ready
    [Arguments]     ${locator}
    Sleep     3
    Wait Until Element Is Visible    ${locator}

Wait until element is ready then input text
    [Arguments]    ${locator}    ${text}
    Wait Until Keyword Succeeds    5x    2s    Input Text    ${locator}    ${text}

Wait until page contains element then verify text
    [Arguments]    ${expected_text}
    Wait Until Keyword Succeeds    5x    2s    Page Should Contain         ${expected_text}

Wait until page contain element tag
    [Arguments]     ${tagxpath}
#    Page Should Contain Element     ${tagxpath}
    Wait Until Element Is Visible    ${tagxpath}
Click element tag
    [Arguments]     ${element}
    Click Element	${element}

Enter Title
    [Arguments]    ${locator}    ${text}
    Input Text     ${locator}    ${text}

Enter Description
    [Arguments]   ${locator}    ${text} 
    Input Text    ${locator}    ${text}

Read All The Data
    [Arguments]     ${testcase_title}    ${testcase_description}
    Log To Console    ${testcase_title} : ${testcase_description}
    Input Text      ${title}    ${testcase_title}
    Input Text      ${desc}    ${testcase_description}
    Click Element   ${createbtn}