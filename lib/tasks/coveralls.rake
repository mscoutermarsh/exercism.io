  # require 'coveralls'
  # require 'SimpleCov'
  require 'coveralls/rake/task'
  Coveralls::RakeTask.new
  task :test_with_coverage do
    # SimpleCov.formatter = Coveralls::SimpleCov::Formatter
    # SimpleCov.command_name 'MiniTest'
    # SimpleCov.start do
    #   add_filter "/test/"
    # end
    
    # Coveralls.wear_merged!

    Rake::Task["test:each"].invoke
    Rake::Task["coveralls:push"].invoke
  end