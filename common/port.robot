*** Settings ***
Library           Device.py


*** Variables ***


*** Keywords ***
port_connect
    [Arguments]    ${dict}
    Device.Connect    ${dict}

port_disconnect
    [Arguments]    ${port_id}
    Device.DisConnect    ${port_id}

send_cmd
    [Arguments]    ${port_id}    ${cmd}    ${end_str}=${None}    ${timeout}=${None}
    ${ret}    Device.Send    ${port_id}    ${cmd}    ${end_str}    ${timeout}
    [Return]    ${ret}
