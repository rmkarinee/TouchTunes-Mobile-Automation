*** Settings ***
Library    AppiumLibrary
Library    BuiltIn
Library    Collections
Library    OperatingSystem
Library    String
Resource   Common.robot

*** Variable ***
${HEADER_SESSION}           tv_home_widget_header
${LIST_MENU_ITEMS}          tv_home_row_title
${ITEM_MENU_TITLE}          Hot at Bar Piranha
${LIST_HOT_AT_OPTIONS}      ctv_item_row_title
${ITEM_HOT_ARTIST}          Hot Artists
${HOT_ARTIST_LIST}          com.touchtunes.android:id/ctv_item_artist_view_name
${HOT_AT_SESSION_ROUND}     widget_item_round_image
${HOT_AT_SESSION_ITEM}      widget_item_round_title

*** Keywords ***
Scroll to hot at session
    Wait Until Element Is Visible    ${HEADER_SESSION} 
    Scroll To Element    ${HOT_AT_SESSION_ROUND}
Scroll to menu on the home page
    ${ELEMENT} =    Get Element By ID And Text    ${LIST_MENU_ITEMS}  ${ITEM_MENU_TITLE}
    Scroll To Element    ${ELEMENT}
 Click on Hot at option
    ${ELEMENT} =    Get Element By ID And Text    ${LIST_MENU_ITEMS}  ${ITEM_MENU_TITLE}
    Wait Until Element Is Visible     ${ELEMENT} 
    Click Element    ${ELEMENT}
Click on Hot artists option
    ${ELEMENT} =    Get Element By ID And Text    ${LIST_HOT_AT_OPTIONS}  ${ITEM_HOT_ARTIST}
    Wait Until Element Is Visible     ${ELEMENT} 
    Click Element    ${ELEMENT}
Create a list of elements
    [Arguments]    ${FILE_NAME}    ${ELEMENT}
    Create new file    ${FILE_NAME}
    Add elements into the file   ${FILE_NAME}    ${ELEMENT}
 Read File Content
    [Arguments]    ${file_path}
    ${file_content}=    Get File    ${file_path}
    [Return]    ${file_content}
Compare File Content
    [Arguments]    ${file1_path}    ${file2_path}
    ${file1_content}=    Read File Content    ${file1_path}
    ${file2_content}=    Read File Content    ${file2_path}
    Should Be Equal As Strings    ${file1_content}    ${file2_content}