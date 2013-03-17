require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

namespace :features do
  Cucumber::Rake::Task.new(:dev) do |t|
    t.profile = 'dev'
  end

  Cucumber::Rake::Task.new(:stage) do |t|
    t.profile = 'stage'
  end

  Cucumber::Rake::Task.new(:prod) do |t|
    t.profile = 'prod'
  end

  Cucumber::Rake::Task.new(:in_progress) do |t|
    t.profile = 'in_progress'
  end

  task :all => [:dev, :stage, :prod]
end