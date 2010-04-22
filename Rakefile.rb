require "rake"
require "rake/testtask"

task :default => [:test_units]

desc "Run unit tests"
Rake::TestTask.new("test_units") { |t|
  t.pattern = 'tests/*.rb'
  t.verbose = true
  t.warning = true
}