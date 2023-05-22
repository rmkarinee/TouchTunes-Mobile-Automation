*** Settings ***
Library     AppiumLibrary
Resource    Common.robot

*** Variable ***
${JUKEBOX_LIST}       item_venue_name
${JUKEBOX_VENUE}      Bar Piranha

*** Keywords ***
Select jukebox
    ${ELEMENT} =    Get Element By ID And Text    ${JUKEBOX_LIST}   ${JUKEBOX_VENUE} 
    Wait Until Element Is Visible     ${ELEMENT}    timeout=10
    Click Element    ${ELEMENT}