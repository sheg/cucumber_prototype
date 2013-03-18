require 'watir-webdriver'

Before do |scenario|
  if ENV['HEADLESS']
    capabilities = Selenium::WebDriver::Remote::Capabilities.htmlunit(:javascript_enabled => true)
    @browser = Watir::Browser.new(:remote, :url => 'http://127.0.0.1:4444/wd/hub', :desired_capabilities => capabilities)
  else
    @browser = Watir::Browser.new :chrome
  end
end

After do |scenario|
  if scenario.failed?
    Dir::mkdir('screenshots') if not File.directory?('screenshots')
    screenshot = "screenshots/#{scenario.name.gsub(' ', '_').gsub(/[^0-9A-Za-z_]/, '')}.png"
    @browser.screenshot.save screenshot
    embed screenshot, 'image/png'
  end
  @browser.close
end
