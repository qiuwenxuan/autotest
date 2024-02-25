*** Settings ***
Documentation     测试用例demo，用例步骤在对应的python文件(testsuit1.py)中编写，本rf文件只是套一个壳子
Suite Setup       suite_setup
Suite Teardown    suite_teardown
Test Setup        test_setup
Test Teardown     test_teardown
Test Timeout      5 minutes 10 seconds    # 每个用例最大执行时间，超过此时间则认为用例超时，强制设置用例结果为失败
Library           testsuit1.py

*** Variables ***
${chip_info}      CreteQemu
${host_info}      Host

*** Test Cases ***
case1:
    testsuit1.testcase1
case2:
    testsuit1.testcase2

case3:
    testsuit1.testcase3

*** Keywords ***
suite_setup
    testsuit1.suit_setup    ${chip_info}    ${host_info}

suite_teardown
    testsuit1.suit_teardown

test_setup
    testsuit1.test_setup

test_teardown
    testsuit1.test_teardown
