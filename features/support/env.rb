require 'rspec-expectations'
require 'page-object'
require 'page-object/page_factory'
require 'data_magic'
require 'fig_newton'

if ENV['HEADLESS']
  require 'selenium/server'
  server = Selenium::Server.new("selenium-server-standalone-2.31.0.jar", :background => true)
  server.start

  at_exit do
    server.stop
  end
end

World(PageObject::PageFactory)