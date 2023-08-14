*** Settings ***
Documentation     To validate the login form with diffrent username's
Library           SeleniumLibrary
Test Teardown     Close Browser session
Test Template     Validate Unsuccessful Login
Resource    resources/resources.robot


*** Test Cases ***
Invalid Username
    [Template]    Validate Unsuccessful Login
    | Aaman         | ${valid_password} |

Invalid Password
    [Template]    Validate Unsuccessful Login
    | ${user_name}  | ploudfg |

Special Characters
    [Template]    Validate Unsuccessful Login
    | @#$*%         | ${valid_password} |

*** Keywords ***
Validate Unsuccessful Login
    [Arguments]     ${username}     ${password}
    Open the browser with the Mortgage payment url
    Fill the login Form    ${username}    ${password}
    Wait until Element is located in the page     ${Error_Message_Login}
    Verify Error Message Is Correct

Verify Error Message Is Correct
    ${result}=    Get Text    ${Error_Message_Login}
    Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.
