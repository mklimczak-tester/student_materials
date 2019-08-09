*** Settings ***
Library           Collections

*** Test Cases ***
Test case 1
    [Documentation]    3 list
    @{lowercase}    Create List    a    b    c
    @{uppercase}    Create List    A    B    C
    @{numbers}    Create List    1    2    3
    ${temp}=    Create combination    ${lowercase}    ${uppercase}
    ${output}=    Create combination    ${temp}    ${numbers}
    Log list    ${output}

Test case 2
    @{lowercase}    Create List    a    b    c
    @{uppercase}    Create List    A    B    C
    @{numbers}    Create List    1    2    3
    ${output}=    Evaluate    [a+b+c for a in ${lowercase} for b in ${uppercase} for c in ${numbers}]
    Log list    ${output}

*** Keywords ***
Apend Prefix
    [Arguments]    ${prefix}    ${list}
    @{output}=    Create List    @{EMPTY}
    : FOR    ${item}    IN    @{list}
    \    Log    ${item}
    \    Append to list    ${output}    ${prefix}${item}
    [Return]    ${output}

Create combination
    [Arguments]    ${list1}    ${list2}
    @{output}=    Create List    @{EMPTY}
    : FOR    ${item}    IN    @{list1}
    \    ${trap}=    Apend Prefix    ${item}    ${list2}
    \    Append To List    ${output}    @{trap}
    [Return]    ${output}
