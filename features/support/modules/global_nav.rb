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
  span(:username_dropdown_button, :class => 'ui-icon ui-icon-triangle-1-s')
  div(:user_dropdown, :id => 'user_dropdown')
  link(:logout, :href => '/login/x_logout')


  def open_username_dropdown
    username_dropdown_button_element.click
    user_dropdown_element.when_visible
  end

  def click_dropdown_logout
    logout_element.when_visible
    logout
  end
end