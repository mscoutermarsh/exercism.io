require 'coveralls/rake/task'
Coveralls::RakeTask.new
task :test_with_coverage do
  Rake::Task["test"].invoke
  Rake::Task["coveralls:push"].invoke
end