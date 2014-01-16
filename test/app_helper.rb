if ENV['CI'] == '1'
  require 'simplecov'
  require 'coveralls'
  Coveralls.wear_merged!
end

require './test/integration_helper'
require './test/approval_helper'

require 'sinatra/base'
require 'rack/test'
require 'rack-flash'

require 'app'
require './test/app_test_helper'
