*** Settings ***
Library    AppiumLibrary

*** Variable ***
${SKIP_BUTTON}            tt_action_bar_right_action_text

*** Keywords ***
Press skip button
    Wait Until Page Contains    ${SKIP_BUTTON}
    Click element                    ${SKIP_BUTTON}