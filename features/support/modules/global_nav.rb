module GlobalNav
  include PageObject

  link(:dashboard_tab, :text => 'Dashboard')
  link(:conversation_buddy_tab, :text => 'ConversationBuddy')
  link(:profile_buddy_tab, :text => 'ProfileBuddy')
  link(:reach_buddy_tab, :text => 'ReachBuddy')
  link(:conversion_buddy_tab, :text => 'ConversionBuddy')
  link(:buy_buddy_tab, :text => 'BuyBuddy')
  link(:analytics_tab, :text => 'Analytics')
  div(:utility_nav, :id => 'utility_nav')
end
