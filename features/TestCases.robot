*** Settings ***
Resource         ../pageObjects/Common.robot
Resource         ../steps/OnboardingSteps.robot
Resource         ../steps/JukeboxListSteps.robot
Resource         ../steps/JukeboxHomeSteps.robot

Test Setup       Open Android Test App
Test Teardown    End session

*** Test Cases ***
Validate Hot Artist List
    Given I access the onboarding page
    And I choose a jukebox nearby
    When I am on the jukebox home page
    And I access hot at item on home page menu to see the artist list
    Then I can validate the list of hot artists