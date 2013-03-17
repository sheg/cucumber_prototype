module ConversationNav
  include PageObject

  link(:home, :text_text => 'Home')
  div(:compose, :class => 'compose')
  div(:success_message, :class => "conversation-toast-container success")
  
  def open_compose_modal
    @browser.driver.manage.window.maximize
    sleep 2  #to do: Look for another element on the page to load
    compose_element.when_visible.click
  end
end