*** Keywords ***
First Keyword with one default arguments via Resource file
    [Documentation]    This is the first keyword with default arguments ${arg1}.
    [Arguments]    ${arg1}    ${arg2}=default2
    Log    This is the first keyword with default arguments: ${arg1}, ${arg2}.
