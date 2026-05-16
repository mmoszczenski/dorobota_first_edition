*** Settings ***
Documentation     This is a test suite for Browser library.

Suite Setup
Suite Teardown

Test Setup
Test Teardown

Task Tags    regression

*** Variables ***
${typu_str1}    ASDDASDAS
${typu_str2}    asd
@{typu_list}    ASDDASDAS    asd    123456
&{typu_dict}    key1=value1    key2=value2    key3=value3
${typu_int}    123456


*** Test Cases ***
Test Case 1
    [Documentation]    This is the first test case.
    ...    LINK_QTEST/REQ/DOC/WIKI
    ...
    ...    *Steps / Expected Results:*
    ...    1. Step 1 / pass
    ...    2. Step 2 / fail
    ...
    ...    *Requirements:*
    ...    ID/NUMER/WORKITEM_ID - e.g ABS-123456
    ...
    ...    *Expected:*
    ...    1. Expected result 1
    ...    - This test should pass if the expected result is met.
    [Tags]    smoke
    Log    Hello, World!
    ${var_str1}    Set Variable    ASD1
    @{lst_1}    Create List    ASD1    ASD2    ASD3
    ${dict_1}    Create Dictionary    key1=value1    key2=value2    key3=value3
    Log    ${lst_1}
    Log    ${typu_list}
    # ${arg1}    ${arg2}    KEY
    # ${moja_list}    Create List    ${arg1}    ${arg2}

    # List
    Keyword Loop with Created List   ${lst_1}
    # ${lst_1}   trafi jako "rozpakowany" argument bo jest podane z @
    Keyword Loop with Dynamic List    arg1    arg2    arg3   arg4    arg5    arg6    arg7    arg8    arg9    arg10    @{lst_1}
    # ${lst_1}   trafi jako jeden argument do pentli, a nie jako lista, dlatego trzeba rozpakować listę za pomocą @
    Keyword Loop with Dynamic List    arg1    arg2    arg3   arg4    arg5    arg6    arg7    arg8    arg9    arg10    ${lst_1}

    # Dictionary
    Keyword Loop with Created Dictionary   ${dict_1}
    Keyword Loop with Dynamic Dictionary   user1=data1    user2=data2    user3=data3    &{dict_1}
    # Tutaj dict_1 trafi jako jeden argument do pentli, a nie jako słownik, dlatego trzeba rozpakować słownik za pomocą &, w innym przypadku kod sie wywali
    # Keyword Loop with Dynamic Dictionary   user1=data1    user2=data2    user3=data3    ${dict_1}





Test Case 2
    [Documentation]    This is the second test case.
    [Tags]    E2E
    Log    Hello, World!    


*** Keywords ***
Keyword 1
    [Documentation]    This is a keyword.
    Log    This is Keyword 1.
    ${var_str2}    Set Variable    ASD2
    ${lst_1}    Create List    ASD1    ASD2    ASD3
    ${dict_1}    Create Dictionary    key1=value1    key2=value2    key3=value3    

Keyword Loop with Created List
    [Documentation]    This is a keyword with a loop.
    [Arguments]    ${list}
    FOR    ${item}    IN    @{list}
        Log    ${item}
    END

Keyword Loop with Dynamic List
    [Documentation]    This is a keyword with a loop for dictionary.
    [Arguments]    @{dynamic_list}
    FOR    ${item}    IN    @{dynamic_list}
        Log    ${item}
    END

Keyword Loop with Created Dictionary
    [Documentation]    This is a keyword with a loop for dictionary for log only keys.
    [Arguments]    ${dict}
    FOR    ${key}    IN    @{dict.keys()}
        Log    ${key}
    END

Keyword Loop with Dynamic Dictionary    
    [Documentation]    This is a keyword with a loop for dictionary for log only keys.
    [Arguments]    &{dict}
    FOR    ${key}    IN    @{dict.keys()}
        Log    ${key}
    END

*** Comments ***
# This is a comment in the test suite.