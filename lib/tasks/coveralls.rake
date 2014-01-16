  require 'coveralls'
  require 'SimpleCov'
  require 'coveralls/rake/task'
  Coveralls::RakeTask.new
  task :test_with_coverage do
    # Coveralls.wear_merged!
    # SimpleCov.formatter = Coveralls::SimpleCov::Formatter
    # SimpleCov.command_name 'MiniTest'
    # SimpleCov.start do
    #   add_filter "/test/"
    # end
    
    # Coveralls.wear_merged!

    Rake::Task["test"].invoke
    Rake::Task["coveralls:push"].invoke
  end