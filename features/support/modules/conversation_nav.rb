module ConversationNav
  include PageObject

  link(:home, :text_text => 'Home')
  div(:compose, :class => 'compose')
  div(:success_message, :class => "conversation-toast-container success")
  link(:outbox_button, :class => 'outbox')
  span(:outbox_number, :id => 'outbox-badge')
  
  def open_compose_modal
    @browser.driver.manage.window.maximize
    outbox_number_element.when_visible
    compose_element.when_visible.click
  end
end