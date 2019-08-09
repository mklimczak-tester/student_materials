*** Settings ***
Library           Collections

*** Variables ***
${SUITE_LEVEL_VARABLE}    DEFAULT_SUITE_VARABLE

*** Test Cases ***
HelloWorld-01
    Log    ${SUITE_LEVEL_VARABLE}
    Set Test Variable    ${SUITE_LEVEL_VARABLE}    Value overwritten by ${TEST_NAME}
    Log    ${SUITE_LEVEL_VARABL

HelloWorld-02
    Log    ${SUITE_LEVEL_VARABLE}

Log Varables Keyword Demo
    Log Variables

TEST _CASE 4
    ${scalar_variable}    Set Variable    abc
    ${scalar_variable}    Convert To Integer    a=1
    @{list_variable}    Create list    a    b    c
    ${dictionary_variable}    Create Dictionary    a=1    b=2    c=3
    Comment    As variables are created is worth to check their type
    ${type}    Evaluate    type{$scalar_variable}
    ${type}    Evaluate    type{$list_variable}
    ${type}    Evaluate    type{$dictionary_variable}
    ${type}    Evaluate    type{${list_variable}}
    ${type}    Evaluate    type{${dictionary_variable}}

Test case 5
    @{list_variable}    Create list    a    b    c
    ${dictionary_variable}    Create Dictionary    a=1    b=2    c=3
    Collections.Log List
    Should Contain    @{list_variable}    a
    Should Contain    @{list_variable}    d
    ${dictionary_keys}    Get Dictionary Keys    ${dictionary_variable}
    ${dictionary_values}    Get Dictionary Values    ${dictionary_variable}

Test Case 6
