if ENV['CI'] == '1'
  require 'simplecov'
  require 'coveralls'
  Coveralls.wear_merged!
end

$:.unshift File.expand_path("../../lib", __FILE__)

ENV['RACK_ENV'] = 'test'

gem 'minitest', '=4.7.5'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
