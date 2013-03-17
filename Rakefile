require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

namespace :features do
  Cucumber::Rake::Task.new(:prod) do |t|
    t.profile = 'prod'
  end

  Cucumber::Rake::Task.new(:staging) do |t|
    t.profile = 'staging'
  end

  Cucumber::Rake::Task.new(:in_progress) do |t|
    t.profile = 'in_progress'
  end
  
  Cucumber::Rake::Task.new(:prod_html) do |t|
    t.profile = 'prod_html'
  end
  
  Cucumber::Rake::Task.new(:staging_html) do |t|
    t.profile = 'staging_html'
  end
  
  Cucumber::Rake::Task.new(:default) do |t|
    t.profile = 'default'
  end
  
  task :all_html => [:prod_html, :staging_html]
end
