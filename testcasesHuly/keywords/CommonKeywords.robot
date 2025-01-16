*** Settings ***
Library             SeleniumLibrary
*** Keywords ***
Wait until element is ready then click element
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds    5x    2s    Click Element    ${locator}

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

Enter Text
    [Arguments]    ${locator}    ${text}
    Input Text     ${locator}    ${text}