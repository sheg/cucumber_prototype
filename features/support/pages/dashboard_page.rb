class DashboardPage
  include PageObject
  include DataMagic
  include GlobalNav

  link(:welcome_tab, :link_text => 'Welcome')

end
