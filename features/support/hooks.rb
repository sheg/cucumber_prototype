require 'watir-webdriver'

Before do |scenario|
  @browser = Watir::Browser.new :chrome
#  caps = Selenium::WebDriver::Remote::Capabilities.chrome
#  caps.version = "11"
#  caps.platform = :LINUX
#  caps[:name] = scenario.title
#  @browser = Watir::Browser.new(
#    :remote,
#    :url => "http://dforkosh:b49e8094-8876-4a5e-96ea-3c98bf9e8576@ondemand.saucelabs.com:80/wd/hub",
#    :desired_capabilities => caps)
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
