@dev
Feature: Compose Post
  As a Conversation Buddy user
  I would like to submit a post to Facebook using a drop down modal
  So that clients can submit posts across their Facebook pages

Background:
  Given I am on the Conversation Buddy tab
  When I click on the compose message button

Scenario: Successfully submit post message
  When I complete the compose message form successfully
  Then the following message should appear "Your message was successfully composed"

Scenario: Submit post with empty message
  When I complete the compose message form using an empty message
  Then the following error message should be present "A message is required"

Scenario: Submit post with empty profile
  When I complete the compose message form using an empty profile
  Then the following error message should be present "You must select at least one profile"

@prod
Scenario: Submit post with empty profile and message
  When I complete the compose message form using an empty profile and message
  Then there should be two errors present
  And the following error messages should be present:

  |error_message|
  |A message is required|
  |You must select at least one profile|

@prod
Scenario: Successfully submit post using JMSports
  When I complete the compose message form successfully using the profile name "JMSports"
  Then the following message should appear "Your message was successfully composed"

@prod
Scenario: Submit post with empty message using JMSports
  When I complete the compose message form successfully using the profile name "JMSports" and an empty message
  Then the following error message should be present "A message is required"
