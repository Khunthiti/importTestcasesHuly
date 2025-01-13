*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    DataDriver      ../resources/data.xlsx        sheet_name=Sheet1
Resource   ../resources/config/config.robot
Resource   ../keywords/CommonKeywords.robot
Suite Setup         Setup Browser
Test Template       Create Test via automate

*** Test Cases ***
Data-Driven Test Case
    [Documentation]  สร้าง Test Case จากข้อมูลใน Excel
    [Template]  Create Test via automate
    Create Test via automate    ${testcase_title}    ${testcase_description}

*** Keywords ***
Setup Browser
    ${ChromeOptions}=     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()  sys,selenium.webdriver
    Call Method    ${ChromeOptions}    add_experimental_option    debuggerAddress    127.0.0.1:9289
    Create WebDriver    Chrome    options=${ChromeOptions}
    Go To    ${baseUrl}
    Wait until page contains element then verify text    ${expected_text}

Create Test via automate
    [Arguments]    ${testcase_title}    ${testcase_description}
    #CommonKeywords.Click element tag                                    xpath=//button[@draggable='false']//span[contains(text(), 'Test library')]
    CommonKeywords.Click element tag                                    xpath=//span[text()='New test case']
    #CommonKeywords.Click element tag                                    xpath=//button[contains(@class, 'antiButton') and @id='space.selector']
    #CommonKeywords.Wait until page contain element tag                  xpath=//span[contains(text(), '${projectNameTC}')]
    #CommonKeywords.Click element tag                                    xpath=//span[contains(text(), '${projectNameTC}')]
    #CommonKeywords.Click element tag                                    xpath=//button[contains(@class, 'antiButton')]//span//div[text()='No test suite']
    #CommonKeywords.Wait until page contain element tag                  xpath=//div[@class='flex-presenter']//span[text()='${testSuiteTC}']
    #CommonKeywords.Click element tag                                    xpath=//div[@class='flex-presenter']//span[text()='${testSuiteTC}']
    #Log To Console                                                       ${testcase_title} : ${testcase_description}
    CommonKeywords.Enter Title                                           ${titleD}       ${testcase_title}
    CommonKeywords.Enter Description                                     ${descD}        ${testcase_description}
    CommonKeywords.Wait until page contain element tag                   ${createbtn}
    CommonKeywords.Click element tag                                     ${statusTestcase}
    #CommonKeywords.Wait until page contain element tag                   ${selectStatus}
    CommonKeywords.Click element tag                                     ${selectStatus}
    CommonKeywords.Click element tag                                     ${createbtn}
