cucumber_prototype
==================

> #Setup
> 1) Install rvm and ruby
> 2) gem install bundler
> 3) bundle install
>

Execution:

1) From the root directory, use rake to execute predefined test executions: 
    a) rake -t to check for available tasks.
    b) e.g. rake features:dev

2) From the root directory, use profiles to execute predefined profiles:
    a) profile definitions are located in cucumber.yml
    b) e.g. cucumber -p dev

3) Execute any feature file:
    a) e.g. cucumber -r features/ features/login/login.feature 
