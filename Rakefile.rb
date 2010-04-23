require "rake"
require "rake/testtask"
require "code/main"

task :default => [:test_units]

desc "Run unit tests"
Rake::TestTask.new("test_units") { |t|
  t.pattern = 'tests/*.rb'
  t.verbose = true
  t.warning = true
}

desc "Sort by gender (females > males) then by LN ASC"
task :output_1 do
  Main.run(1)
end

desc "Sort by DOB ASC"
task :output_2 do
  Main.run(2)
end

desc "Sort by LN DESC"
task :output_3 do
  Main.run(3)
end