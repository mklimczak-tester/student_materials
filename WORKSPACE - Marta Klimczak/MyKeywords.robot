*** Test Cases ***
Keywords - Classic
    ${var1}=    Multiply Integer by 2    4
    ${var2}=    Multiply Integer by 2 but diff    ${var1}
    ${var3}=    Multiply to given variables    ${var1}    ${var2}
    @{list}=    Create custome list    3    4
    ${var4}=    Multiply to given variables    @{list}
    &{dict}=    Create Dictionary    3=abc    6=def
    ${var5}=    Multiply to given variables    @{dict}
    ${var6}=    Multiply to given variables    3    3    3
    Take "TEST" and log it with "WARN" level

IfStatements
    ${var1}=    Multiply Integer by 2    4
    ${log}=    Set Variable If    ${var1}< 7    Variable is less then 7    Variable is greater then 7
    Log    ${log}
    ###
    @{list}    Create List    @{EMPTY}
    ${log}=    Set Variable If    ${list}    List is non-empty    List is empty
    Log    ${log}
    ###
    ${var1}=    Multiple Integer by 2 and resert if over 8    ${var1}
    ${var1}=    Multiple Integer by 2 and resert if over 8    ${var1}

*** Keywords ***
Multiply Integer by 2
    [Arguments]    ${input_integer}
    ${converted_input}    Convert To Integer    ${input_integer}
    ${output}=    Evaluate    ${converted_input} * 2
    Return From Keyword    ${output}

Multiply Integer by 2 but diff
    [Arguments]    ${input_integer}
    ${converted_input}    Convert To Integer    ${input_integer}
    ${output}=    Evaluate    ${converted_input} * 2
    [Return]    ${output}

Multiply to given variables
    [Arguments]    ${input_integer1}    ${input_integer2}    ${input_integer3}=1
    ${converted_input1}    Convert To Integer    ${input_integer1}
    ${converted_input2}    Convert To Integer    ${input_integer2}
    ${converted_input3}    Convert To Integer    ${input_integer3}
    ${output}=    Evaluate    ${converted_input1} * ${converted_input2} * ${converted_input3}
    [Return]    ${output}

Create custome list
    [Arguments]    @{argus}
    [Return]    @{argus}

Take "${some_string_variable}" and log it with "${level}" level
    Log    ${some_string_variable}    level=${level}

Multiple Integer by 2 and resert if over 8
    [Arguments]    ${var1}
    ${var1}    Run Keyword If    ${var1} == 8    Multiply Integer by 2    ${var1}
    ...    ELSE    Set Variable    0
    ${log_level}    Set Variable If    ${var1}== 0    WARN    INFO
    Log    ${var1}    level=${log_level}
    [Return]    ${var1}
