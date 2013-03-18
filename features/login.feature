@stage
Feature: Login
  As a customer
  I would like to go through an authentication process
  So that I can properly log into the application

Background:
  Given I am on the login page

@in_progress
Scenario: log in successfully
  When I submit the login form with valid credentials
  Then I should be logged into the application

Scenario: attempt to log in using incorrect email
  When I submit the login form with invalid email
  Then I should see the following error message "Login Failed"