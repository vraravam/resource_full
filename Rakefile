require 'rake'
require 'spec/rake/spectask'
require 'rcov/rcovtask'

task :default => :spec

ENV['RAILS_ROOT'] = File.expand_path("../../../")

Spec::Rake::SpecTask.new do |t|
  t.spec_opts = ['--options', 'spec/spec.opts']
end

require 'rcov/version'

Rcov::RcovTask.new do |t|
  t.pattern = "spec/**/_spec.rb"
  t.rcov_opts = [ "--spec-only" ]
  t.output_dir = "coverage"
end

