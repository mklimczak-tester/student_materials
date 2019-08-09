*** Keywords ***
Search for Article and Change language
    [Arguments]    ${phase}    ${language}
    Wait and Click    //*[@class="hide-arrow"]
    Select From List By Value    //*[@id="searchLanguage"]    ${language}
    Wait And Input    //*[@id="searchInput"]    ${phase}
    Wait and Click    //*[@id="search-form"]/fieldset/button

Wait and Click
    [Arguments]    ${selector}    ${timeout}=${TRANSITION_DELAY}
    Wait Until Element Is Visible    ${selector}    ${timeout}
    Click Element    ${selector}

Wait And Input
    [Arguments]    ${selector}    ${content}    ${timeout}=${TRANSITION_DELAY}
    Wait Until Element Is Visible    ${selector}    ${timeout}
    Input Text    ${selector}    ${content}

Check number of pages
    ${result}    Get Element Count    //*[@class="mw-search-result"]
    ${expected_result}    Get Text    //*[@id="mw-search-top-table"]/*//strong
    ${expected_result}    Split String    ${expected_result}
    ${expected_result}    Get From List    ${expected_result}    -1
    Should Be Equal As Integers    ${result}    ${expected_result}
