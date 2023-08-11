*** Settings ***
Documentation   to validate a login form
Library    SeleniumLibrary
Test Teardown   Close Browser session
Resource    ./resources/resources.robot

*** Test Cases ***
Validate UnSuccesful Login
    [Tags]      SMOKE
    Open the browser with the Mortgage payment url
    Fill the login Form     ${user_name}    ${invalid_password}
    Wait until Element is located in the page     ${Error_Message_Login}
    verify error message is correct

*** Keywords ***

verify error message is correct
   ${result}=   Get Text    ${Error_Message_Login}
   Should Be Equal As Strings     ${result}     Incorrect username/password.
   Element Text Should Be       ${Error_Message_Login}      Incorrect username/password.
