Given /^I navigate to the login page$/ do
  visit_page(LoginPage)
end

When(/^I submit the login form with valid credentials$/) do
  on_page(LoginPage).input_login_credentials
  on_page(LoginPage).signin
end

When(/^I submit the login form with invalid email$/) do
  on_page(LoginPage).input_login_credentials('iamfake@fake.com')
  on_page(LoginPage).signin
end

Then(/^I should see the following error message "(.*?)"$/) do |error_message|
  on_page(LoginPage).error_element.text.should include error_message
end

Then(/^I should be logged into the application$/) do
  on_page(DashboardPage).username_dropdown_button?.should be_true, 'Could not see the first_name element in the nav bar'
end
When /^I click the logout button$/ do
  on_page(DashboardPage).open_username_dropdown
  on_page(DashboardPage).click_dropdown_logout
end

Then(/^I am on the login page$/) do
  on_page(LoginPage).email?.should be_true
end