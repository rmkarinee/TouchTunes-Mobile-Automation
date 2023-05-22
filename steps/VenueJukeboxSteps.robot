*** Settings ***
Resource         ../pageObjects/VenueJukebox.robot

*** Keywords ***
I am on the jukebox venue page
    Scroll to hot at session
    Create a list of elements    ${CURDIR}/../utils/ArtistsList1.txt    widget_item_round_title
I want to see a Hot at artists list
    Scroll to menu on the home page
    Click on Hot at option
    Click on Hot artists option
I create a list of artists
    Create a list of elements    ${CURDIR}/../utils/ArtistsList2.txt     com.touchtunes.android:id/ctv_item_artist_view_name
I can validade if this list is equal a home page hot artists list
    Compare File Content    ${CURDIR}/../utils/ArtistsList1.txt    ${CURDIR}/../utils/ArtistsList2.txt
