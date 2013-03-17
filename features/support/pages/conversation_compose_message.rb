class ConversationComposeMessage
  include PageObject
  include ConversationNav
  include GlobalNav
  include DataMagic

  DataMagic.load('conversation_buddy.yml')

  text_field(:profile, :class => 'placeholder')
  span(:profile_name_drop_down, :class => 'profile-name')
  text_area(:message, :class => 'input gray placeholder')
  button(:publish, :class => 'btn btnSecondary green actionSend')

  def complete_message_form(data = {})
    message_data = data_for(:compose_message, data)
    add_profile message_data['profile_name']
    add_message message_data['message']
  end

  def add_profile(profile_name)
    self.profile_element.when_visible
    self.profile = profile_name
    self.profile_name_drop_down_element.when_visible(timeout = 10).click
  end

  def add_message(message)
    self.message = message
  end

  #errors
  div(:error_div, :class => 'compose-modal-errors')
  unordered_list(:error_list) do |page|
    page.error_div_element.unordered_list_element
  end

  def error_messages
    error_list_element.text
  end
end