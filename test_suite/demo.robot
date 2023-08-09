*** Settings ***
Documentation   to validate a login form
Library    SeleniumLibrary
Test Teardown   Close Browser
Resource    ./resources/resources.robot

*** Test Cases ***
Validate successful login
    Open the browser with the Mortgage payment url
    Fill the login Form
    wait until it checks and display error message
    verify error message is correct

*** Keywords ***
Open the browser with the Mortgage payment url
    Create Webdriver  ${browser_name}
    Go To    ${url}

Fill the login Form
    Input Text    id:username   ${user_name}
    Input Password    id:password   ${invalid_password}
    Click Button    signInBtn

wait until it checks and display error message
    Wait Until Element Is Visible   ${Error_Msg_Login}

verify error message is correct
#    ${result}=  Get Text    ${Error_Msg_Login}
#    Should Be Equal As Strings    ${result}     Incorrect username/password.
    Element Text Should Be    ${Error_Msg_Login}    Incorrect username/password.