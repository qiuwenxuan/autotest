*** Variables ***


*** Keywords ***
should_not_contain
    [Arguments]    ${ret}    ${str}
    # log    ${ret}
    #判断ret中不应该包含str，如包含了则出错
    Run Keyword And Continue On Failure    Should Not Contain Any    ${ret}    ${str}

should_contain
    [Arguments]    ${ret}    ${str}
    # log    ${ret}
    #判断ret中应该包含str，如不包含了则出错
    Run Keyword And Continue On Failure    Should Contain Any    ${ret}    ${str}

