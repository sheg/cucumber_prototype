cucumber_prototype
==================

> #SETUP
> * Install rvm and ruby
> * gem install bundler
> * bundle install
>

> #EXECUTION
> * From the root directory, use rake to execute predefined test executions: 
> > * rake -t to check for available tasks.
> > * e.g. rake features:dev
>
> * From the root directory, use profiles to execute predefined profiles:
> > * profile definitions are located in cucumber.yml
> > * e.g. cucumber -p dev

> #Execute any feature file
> * cucumber -r features <feature_path>
> * e.g. cucumber -r features/ features/login/login.feature 
>
