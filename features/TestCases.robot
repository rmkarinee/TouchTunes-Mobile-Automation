*** Settings ***
Resource         ../pageObjects/Common.robot
Resource         ../steps/OnboardingSteps.robot
Resource         ../steps/JukeboxListSteps.robot
Resource         ../steps/VenueJukeboxSteps.robot

Test Setup       Open Android Test App

*** Test Cases ***
Compare Hot at list
    Given I access the onboarding page
    And I choose a jukebox nearby me
    When I am on the jukebox venue page
    And I want to see a Hot at artists list
    And I create a list of artists
    Then I can validade if this list is equal a home page hot artists list

