*** Settings ***
Library    SeleniumLibrary
*** Variables ***

${baseUrl}          https://huly.incubate.apps.changan.co.th/workbench/it/testManagement/677e18a510ffbb18b65bf7b8/library?attachedTo=677e27420fcfb423a1c1cf93
${expected_text}    Test Management
${REMOTE}           http://127.0.0.1:9222
${url}              https://huly.incubate.apps.changan.co.th/workbench/changan/testManagement
${titleD}           xpath=//input[@type='text' and @placeholder='Test case title']
${descD}            xpath=//p[@class='is-empty is-editor-empty']
${createbtn}        xpath=//button[@class='antiButton primary large jf-center sh-no-shape bs-solid gap-medium']
${statusTestcase}   xpath=//button[contains(@class, 'antiButton') and span[text()='Draft']]
${selectStatus}     xpath=//button[@class='menu-item withList w-full' and .//span[text()='Approved']]
${projectNameTC}    For Robot
${testSuiteTC}      For Manual
*** Keywords ***
Open And Maximize Browser
    [Arguments]    ${baseUrl}    ${browser}
    Open Browser    ${baseUrl}    ${browser}
    Maximize Browser Window
Close Chrome Browser
    Close All Browsers