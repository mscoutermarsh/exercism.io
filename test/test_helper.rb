$:.unshift File.expand_path("../../lib", __FILE__)
# require 'SimpleCov'

ENV['RACK_ENV'] = 'test'

gem 'minitest', '=4.7.5'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
