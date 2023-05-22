*** Settings ***
Library    AppiumLibrary

*** Variable ***
${SKIP_BUTTON}            tt_action_bar_right_action_text

*** Keywords ***
Press skip button
    Wait Until Element Is Visible    ${SKIP_BUTTON}    timeout=10
    Click element                    ${SKIP_BUTTON}