require 'coveralls'
SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.use_merging true
SimpleCov.start do
  add_filter 'test'
end