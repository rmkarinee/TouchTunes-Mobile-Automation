*** Settings ***
Library    AppiumLibrary
Library    OperatingSystem
Library    Collections

*** Variables ***
${ANDROID_AUTOMATION_NAME}    UIAutomator2
${ANDROID_APP}                ${CURDIR}/../resources/TouchTunes.apk
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_PLATFORM_VERSION}   %{ANDROID_PLATFORM_VERSION=11}
${ANDROID_APP_PACKAGE}        com.touchtunes.android
${APPACTIVITY}                com.touchtunes.android.activities.SplashScreenActivity
${FILE_ONE}                   ${CURDIR}/../utils/ArtistsList1.txt 
${FILE_TWO}                   ${CURDIR}/../utils/ArtistsList2.txt

*** Keywords ***
Open Android Test App
  Open application  http://127.0.0.1:4723/wd/hub  
  ...  app=${ANDROID_APP} 
  ...  appActivity=${APPACTIVITY}  
  ...  appPackage=${ANDROID_APP_PACKAGE}  
  ...  platformName=${ANDROID_PLATFORM_NAME} 
  ...  automationName=${ANDROID_AUTOMATION_NAME} 
  ...  platformVersion=${ANDROID_PLATFORM_VERSION}
  ...  autoGrantPermissions=true
  Set Location    45.5018869    -73.5673919 

End session
    Remove Files      ${FILE_ONE}    ${FILE_TWO}
    Close Application

Get Element List By ID
    [Arguments]    ${ELEMENT_ID}
    ${ELEMENTS} =    Get Webelements    id=${ELEMENT_ID}
    [Return]    ${ELEMENTS}

Get Element By ID And Text
    [Arguments]    ${ELEMENT_ID}    ${TEXT}
    ${LOCATOR} =    Catenate    xpath=//*[contains(@resource-id, '${ELEMENT_ID}') and contains(@text, '${TEXT}')]
    [Return]    ${LOCATOR}
Scroll To Element
    [Arguments]    ${ITEM}
    ${ELEMENT_VISIBLE} =    Run Keyword And Return Status    Page Should Contain Element    ${ITEM}
    Run Keyword If    not ${ELEMENT_VISIBLE}    Swipe Until Element Is Visible    ${ITEM}
Swipe Until Element Is Visible
    [Arguments]    ${ITEM}
    ${ELEMENT_VISIBLE} =    Run Keyword And Return Status    Page Should Contain Element   ${ITEM}
    Run Keyword If    ${ELEMENT_VISIBLE}    Return From Keyword
    FOR    ${COUNTER}    IN RANGE    3
        Swipe By Percent    50    70    50    30    500
        ${ELEMENT_VISIBLE} =    Run Keyword And Return Status    Page Should Contain Element    ${ITEM}
        Run Keyword If    ${ELEMENT_VISIBLE}    Return From Keyword
    END
Create new file
    [Arguments]    ${FILE}   
    Create File    ${FILE} 
Add elements into the file using scroll
    [Arguments]    ${FILE}    ${ELEMENT_ID}
    ${ELEMENT_LIST} =    Get Element List By ID   ${ELEMENT_ID}
    FOR    ${counter}    IN RANGE    2
        FOR    ${ELEMENT}    IN    @{ELEMENT_LIST}
            Append To File    ${FILE}    ${ELEMENT.text}\n
            Log    ${ELEMENT.text}
        END
    Scroll the entire screen   
    END
Add elements into the file using swipe 
    [Arguments]    ${FILE}    ${ELEMENT_ID}
    ${ELEMENT_LIST} =    Get Element List By ID   ${ELEMENT_ID}
    FOR    ${counter}    IN RANGE    1
        FOR    ${ELEMENT}    IN    @{ELEMENT_LIST}
            Append To File    ${FILE}    ${ELEMENT.text}\n
            Log    ${ELEMENT.text}
        END
    END
Scroll the entire screen
    ${screen_width}    Get Window Width
    ${screen_height}    Get Window Height
    ${start_x}    Set Variable    ${screen_width / 2}
    ${start_y}    Set Variable    ${screen_height * 0.7}
    ${end_x}    Set Variable    ${screen_width / 2}
    ${end_y}    Set Variable    ${screen_height * 0.2}

    Swipe    ${start_x}    ${start_y}    ${end_x}    ${end_y}    1000
    Sleep    3s

 Swipe the entire screen  
    ${screen_width}    Get Window Width
    ${screen_height}   Get Window Height
    ${start_x}    Set Variable    ${screen_width * 0.5} 
    ${start_y}    Set Variable    ${screen_height * 0.8}
    ${end_x}      Set Variable    ${screen_width * 0.5}
    ${end_y}      Set Variable    ${screen_height * 0.2}
    Swipe    ${start_x}    ${start_y}    ${end_x}    ${end_y}
    Sleep    3s