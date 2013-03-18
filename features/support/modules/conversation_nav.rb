module ConversationNav
  include PageObject

  link(:home, :text_text => 'Home')
  div(:compose, :class => 'compose')
  div(:success_message, :class => "conversation-toast-container success")
  span(:outbox_number, :id => 'outbox-badge') #Should always be present?
  
  def open_compose_modal
    #headless browser cant use window
    @browser.driver.manage.window.maximize unless @browser.driver.browser.to_s == 'htmlunit'
    outbox_number_element.when_visible
    compose_element.when_visible.click
  end
end