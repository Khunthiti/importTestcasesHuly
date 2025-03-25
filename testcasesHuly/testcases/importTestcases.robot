*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    DataDriver      ../resources/data.xlsx        sheet_name=Sheet1
Resource   ../resources/config/config.robot
Resource   ../keywords/CommonKeywords.robot
Suite Setup         Setup Browser
Test Template       Create Test via automate


#---Test Cases detail---#
*** Test Cases ***
Data-Driven Test Case
    [Documentation]  สร้าง Test Case จากข้อมูลใน Excel
    [Template]  Create Test via automate
    Create Test via automate    ${testcase_title}    ${testcase_description}

*** Keywords ***
#Using existing browser#
Setup Browser
    ${ChromeOptions}=     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()  sys,selenium.webdriver
    Call Method    ${ChromeOptions}    add_experimental_option    debuggerAddress    127.0.0.1:9289
    Create WebDriver    Chrome    options=${ChromeOptions}
    Go To    ${baseUrl}
    Wait until page contains element then verify text    ${expected_text}

Create Test via automate
    [Arguments]    ${testcase_title}    ${testcase_description}
    #--- Step for create test cases ---#
    CommonKeywords.Click element tag                            xpath=//span[text()='New test case']
    CommonKeywords.Enter Text                                   ${titleD}       ${testcase_title}
    CommonKeywords.Wait until page contain element tag          ${descD}
    CommonKeywords.Enter Text                                   ${descD}        ${testcase_description}
    CommonKeywords.Wait until page contain element tag          ${statusTestcase}
    #--- Step for add the test cases status ---#
    CommonKeywords.Click element tag                            ${statusTestcase}
    CommonKeywords.Click element tag                            ${selectStatus}
    #--- Step for click create button ---#
    CommonKeywords.Click element tag                            ${createbtn}
