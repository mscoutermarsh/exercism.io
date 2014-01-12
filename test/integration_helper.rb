if ENV['CI'] == '1'
  require 'coveralls'
  Coveralls.wear_merged!
end

ENV['RACK_ENV'] = 'test'
require 'bundler'
Bundler.require
require './test/active_record_helper'
require 'exercism'
