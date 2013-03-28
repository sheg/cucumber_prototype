require 'watir-webdriver'
require 'yaml'

#Run with either local-Chrome or Sauce

def set_sauce_browser(test_name)
  filename = File.expand_path("../../../config/sauce_creds.yml", __FILE__)
  sauce_config = YAML::load(File.open(filename))
  sauce_browser = sauce_config[:browser]
  @sauce_user = sauce_config[:username]
  @sauce_key = sauce_config[:access_key]
  case sauce_browser
    when 'firefox'
      caps = Selenium::WebDriver::Remote::Capabilities.firefox
      caps[:platform] = sauce_config[:platform]
      caps[:version] = sauce_config[:version]
    when 'chrome'
      caps = Selenium::WebDriver::Remote::Capabilities.chrome
      caps[:platform] = sauce_config[:platform]
    else
      raise "sauce browser not specified correctly - #{sauce_browser}"
  end
  caps[:name] = test_name
  Watir::Browser.new(
    :remote,
    :url => "http://#{@sauce_user}:#{@sauce_key}@ondemand.saucelabs.com:80/wd/hub",
    :desired_capabilities => caps)
end

def test_name(scenario)
  if scenario.respond_to? :feature
    "#{scenario.feature.title}: #{scenario.name}"
  elsif scenario.respond_to? :scenario_outline
    "#{scenario.scenario_outline.feature.name}: #{scenario.scenario_outline.name}: #{scenario.name}"
  end
end

def set_local_browser
  Watir::Browser.new :chrome
end

def use_sauce_rest(json, saucelabs_user, saucelabs_key)
  %x{curl -H "Content-Type:text/json" -s -X PUT -d '#{json}' http://#{saucelabs_user}:#{saucelabs_key}@saucelabs.com/rest/v1/#{saucelabs_user}/jobs/#{$session_id}}
end

Before do |scenario|
  if ENV['SAUCE']
    @browser = set_sauce_browser(test_name(scenario))
  else
    @browser = set_local_browser
  end
  @browser.driver.manage.window.maximize
  @browser.driver.manage.timeouts.implicit_wait = 5
  $session_id = @browser.driver.instance_variable_get(:@bridge).session_id
end

After do |scenario|
  if scenario.failed?
    date = Time.now
    Dir::mkdir('results/screenshots') if not File.directory?('results/screenshots')
    screenshot = "results/screenshots/#{scenario.name.gsub(' ', '_').gsub(/[^0-9A-Za-z_]/, '')}_#{date.year}_#{date.month}_#{date.day}_#{date.hour}.png"
    @browser.screenshot.save screenshot
    embed screenshot, 'image/png'
  end

  if ENV['SAUCE']
    use_sauce_rest(%Q{{"passed": #{scenario.passed?}}}, @sauce_user, @sauce_key)
    use_sauce_rest(%Q{{"tags": #{scenario.source_tag_names}}}, @sauce_user, @sauce_key)
  end
  @browser.close
end