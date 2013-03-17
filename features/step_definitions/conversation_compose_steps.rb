Given(/^I am on the Conversation Buddy tab$/) do
  visit_page(LoginPage)
  on_page(LoginPage).input_login_credentials
  on_page(LoginPage).signin
  on_page(DashboardPage).conversation_buddy_tab
end

When(/^I click on the compose message button$/) do
  on_page(ConversationDashboard).open_compose_modal
end

When(/^I complete the compose message form successfully$/) do
  on_page(ConversationComposeMessage).complete_message_form
  on_page(ConversationComposeMessage).publish
end

Then(/^the following message should appear "(.*?)"$/) do |expected_message|
  on_page(ConversationDashboard).success_message_element.when_visible.text.should include expected_message
end

When(/^I complete the compose message form using an empty message$/) do
  on_page(ConversationComposeMessage).complete_message_form('message' => '')
  on_page(ConversationComposeMessage).publish
end

Then(/^the following error message should be present "(.*?)"$/) do |error_message|
  on_page(ConversationComposeMessage).error_messages.should include error_message
end
