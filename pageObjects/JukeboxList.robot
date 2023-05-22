*** Settings ***
Library    AppiumLibrary

*** Variable ***
${JUKEBOX_LOCATION}      //*[contains(@text, 'Bar Piranha')]

*** Keywords ***
Select jukebox
    Wait Until Element Is Visible    ${JUKEBOX_LOCATION}
    Click Element                    ${JUKEBOX_LOCATION}