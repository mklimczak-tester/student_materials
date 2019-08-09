*** Settings ***
Force Tags        Force
Default Tags      Default

*** Test Cases ***
test with no tags
    No Operation

Test with tag
    [Tags]    TEST_TAG
    No Operation

Test with empty tags
    [Tags]
    No Operation
