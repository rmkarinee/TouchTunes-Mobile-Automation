*** Settings ***
Resource         ../pageObjects/JukeboxHome.robot
Resource         ../pageObjects/Common.robot

*** Keywords ***
I am on the jukebox home page
    Scroll to hot at session
    Create a list of elements using swipe   ${FILE_ONE}     ${HOT_AT_SESSION_ITEM}
I access hot at item on home page menu to see the artist list
    Scroll to menu on the home page
    Click on Hot at option
    Click on Hot artists option
    I create a list of artists
I create a list of artists
    Create a list of elements using scroll   ${FILE_TWO}    ${HOT_ARTIST_LIST} 
I can validate the list of hot artists
    Compare File Content    ${FILE_ONE}    ${FILE_TWO}
