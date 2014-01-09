require 'coveralls'
Coveralls.wear_merged!

SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start do
  add_filter "/test/"
end


