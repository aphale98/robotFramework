*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary


*** Variables ***
${user_name}                rahulshettyacademy
${invalid_password}         123445
${valid_password}           learning
${url}                      https://rahulshettyacademy.com/loginpagePractise/
${browser_name}             Chrome
${Error_Message_Login}      css:.alert-danger
${Shop_page_load}           css:.nav-link





*** Keywords ***

Open the browser with the Mortgage payment url
    Create Webdriver    ${browser_name}
    Go To   ${url}

Fill the login Form
    [arguments]     ${username}     ${password}
    Input Text          id:username     ${username}
    Input Password      id:password     ${password}
    Click Button        signInBtn

Wait until Element is located in the page
    [arguments]     ${element}
    Wait Until Element Is Visible       ${element}

Close Browser session
    Close Browser





