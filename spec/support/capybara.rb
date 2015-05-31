require 'capybara/rspec'
require 'capybara/rails'
require 'capybara-screenshot/rspec'

Capybara.default_wait_time = 15
Capybara.javascript_driver = :webkit
Capybara.ignore_hidden_elements = true
