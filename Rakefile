require "bundler/gem_tasks"
require 'rake/testtask'

Rake::TestTask.new do |t|
	t.libs << 'test'
	t.libs << 'lib'
	t.test_files = FileList['test/**/*_spec.rb']
end
desc "Run tests"
task :default => :test 
