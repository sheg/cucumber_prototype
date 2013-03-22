require 'watir-webdriver'
require 'yaml'

Before do |scenario|

  if ENV['SAUCE']
    filename = File.expand_path("../../../config/sauce_creds.yml", __FILE__)
    sauce_config = YAML::load(File.open(filename))
    case sauce_config[:browser]
      when 'firefox'
        caps = Selenium::WebDriver::Remote::Capabilities.firefox
        caps[:platform] = sauce_config[:platform]
        caps[:version] = sauce_config[:firefox_version]
    end

    caps[:name] = scenario.title
    @browser = Watir::Browser.new(
        :remote,
        :url => "http://#{sauce_config[:username]}:#{sauce_config[:access_key]}@ondemand.saucelabs.com:80/wd/hub",
        :desired_capabilities => caps)

  elsif ENV['HEADLESS']
    capabilities = Selenium::WebDriver::Remote::Capabilities.htmlunit(:javascript_enabled => true)
    @browser = Watir::Browser.new(:remote, :url => 'http://127.0.0.1:4444/wd/hub', :desired_capabilities => capabilities)
  else
    @browser = Watir::Browser.new :chrome
  end
  @browser.driver.manage.window.maximize unless @browser.driver.browser.to_s == 'htmlunit'
end

After do |scenario|
  if scenario.failed?
    date = Time.now
    Dir::mkdir('results/screenshots') if not File.directory?('results/screenshots')
    screenshot = "results/screenshots/#{scenario.name.gsub(' ', '_').gsub(/[^0-9A-Za-z_]/, '')}_#{date.year}_#{date.month}_#{date.day}_#{date.hour}.png"
    @browser.screenshot.save screenshot
    embed screenshot, 'image/png'
  end
  @browser.close
end