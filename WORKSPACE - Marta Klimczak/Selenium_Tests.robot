*** Settings ***
Test Setup        Run Keywords    Open Browser    ${SITE1}
...               AND    Maximize Browser Window
Test Teardown     Close All Browsers
Test Template     Get to WIki article
Library           SeleniumLibrary
Library           String
Resource          Wikipedia_Main_Page.robot
Library           Collections

*** Variables ***
${SITE1}          https://www.wikipedia.org/    # Wikipedia URL 1
${PAGE_DELAY}     100ms
${TRANSITION_DELAY}    2x

*** Test Cases ***    Incorrect PHASE    LANGUAGE    TIP
TemplateTest 1        HP Lovcraft        pl          Lovecraft

TemplateTest 2        Franko Revenge     pl          Franko

TemplateTest 3        Genisys            pl          Genisys

*** Keywords ***
Get to WIki article
    [Arguments]    ${incorrect_phase}    ${language}    ${tip}
    Search for Article and Change language    ${incorrect_phase}    ${language}
    Check number of pages
    Wait and Click    //span[@class="searchmatch" and text()="${tip}"]
    Sleep    1s
