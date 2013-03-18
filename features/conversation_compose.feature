@dev
Feature: Compose Post
  As a Conversation Buddy user
  I would like to submit a post to Facebook using a drop down modal
  So that clients can submit posts across their Facebook pages

Background:
  Given I am on the Conversation Buddy tab
  When I click on the compose message button

Scenario: Successfully submit post
  When I complete the compose message form successfully
  Then the following message should appear "Your message was successfully composed"

@in_progress
Scenario: Submit post with empty message
  When I complete the compose message form using an empty message
  Then the following error message should be present "A message is required"