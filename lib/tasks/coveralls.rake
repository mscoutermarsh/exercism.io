  require 'coveralls/rake/task'
  Coveralls::RakeTask.new
  task :test_with_coveralls => ['test:each', 'coveralls:push']