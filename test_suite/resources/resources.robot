*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary


*** Variables ***
${user_name}             rahulshettyacademy
${invalid_password}      123445
${valid_password}        learning
${url}                   https://rahulshettyacademy.com/loginpagePractise/
${browser_name}          Chrome
${Error_Msg_Login}       css:.alert-danger




*** Keywords ***

open the browser with the Mortgage payment url
    Create Webdriver    ${browser_name}
    Go To   ${url}

open the browser with the url
    Create Webdriver    ${browser_name}
    Go To   ${url}

Close Browser session
    Close Browser

Wait Until element passed is located on Page
    [arguments]         ${page_locator}
    Wait Until Element Is Visible        ${page_locator}        timeout=10





