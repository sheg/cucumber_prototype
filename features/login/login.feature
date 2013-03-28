@prod
Feature: Login
  As a customer
  I would like to go through an authentication process
  So that I can properly log into the application

Background:
  Given I navigate to the login page


Scenario: log in successfully
  When I submit the login form with valid credentials
  Then I should be logged into the application

Scenario: attempt to log in using incorrect email
  When I submit the login form with invalid email
  Then I should see the following error message "Login Failed"

  @wip
Scenario: successfully log out of the application
  When I submit the login form with valid credentials
  And I click the logout button
  Then I am on the login page
