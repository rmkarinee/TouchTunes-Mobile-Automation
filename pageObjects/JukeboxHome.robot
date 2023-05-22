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
${HOT_ARTIST_LIST}          ctv_item_artist_view_name
${HOT_AT_SESSION_ROUND}     widget_item_round_image
${HOT_AT_SESSION_ITEM}      widget_item_round_title

*** Keywords ***
Scroll to hot at session
    Wait Until Element Is Visible    ${HEADER_SESSION}    timeout=10
    Scroll To Element  ${HOT_AT_SESSION_ROUND}
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
Create a list of elements using scroll
    [Arguments]    ${FILE_NAME}    ${ELEMENT}
    Create new file    ${FILE_NAME}
    Add elements into the file using scroll   ${FILE_NAME}    ${ELEMENT}
Create a list of elements using swipe 
    [Arguments]    ${FILE_NAME}    ${ELEMENT}
    Create new file    ${FILE_NAME}
    Add elements into the file using swipe   ${FILE_NAME}    ${ELEMENT}

 Read File Content
    [Arguments]    ${FILE_PATH}
    ${FILE_CONTENT}=    Get File    ${FILE_PATH}
    [Return]    ${FILE_CONTENT}
Compare File Content
    [Arguments]    ${FILE1_PATH}    ${FILE2_PATH}

    ${FILE1_CONTENT}    Get File    ${FILE1_PATH}
    ${FILE2_CONTENT}    Get File    ${FILE2_PATH}

    ${FILE1_LIST}    Split To Lines    ${FILE1_CONTENT}
    ${FILE2_LIST}    Split To Lines     ${FILE2_CONTENT}

    FOR    ${LINE}    IN    @{FILE1_LIST} 
        ${WORDS}    Split To Lines     ${LINE}
        FOR    ${WORD}    IN    @{WORDS}
            Should Contain    ${FILE2_LIST}     ${WORD}
        END
    END