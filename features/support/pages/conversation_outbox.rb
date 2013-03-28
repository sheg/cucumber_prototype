class ConversationOutbox
  include PageObject
  include DataMagic

  div(:outbox_div, :id => 'outbox')


end