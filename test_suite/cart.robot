*** Settings ***
Documentation   To validate the cart details
Library     SeleniumLibrary
Library     Collections
Test Setup      Open the browser with the Mortgage payment url
Test Teardown   Close Browser session
Resource        ./resources/resources.robot


*** Test Cases ***
Validate Cart and display in the Shopping Page
    Fill the login Form     ${user_name}    ${valid_password}
    Wait until Element is located in the page     ${Shop_page_load}
    Verify Cart titles in the Shop page
    Select the Cart     Nokia Edge


*** Keywords ***
Verify Cart titles in the Shop page
   @{expectedList} =    Create List     iphone X    Samsung Note 8      Nokia Edge       Blackberry
   ${elements} =  Get WebElements     css:.card-title
   @{actualList} =   Create List
   FOR  ${element}  IN      @{elements}
      Log   ${element.text}
      Append To List    ${actualList}     ${element.text}
   END
   Lists Should Be Equal   ${expectedList}    ${actualList}


Select the Cart
    [arguments]     ${cardName}
    ${elements} =  Get WebElements     css:.card-title
    ${index}=   Set Variable    1
     FOR  ${element}  IN      @{elements}
         Exit For Loop If      '${cardName}' == '${element.text}'
         ${index}=  Evaluate   ${index} + 1
     END
    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button
