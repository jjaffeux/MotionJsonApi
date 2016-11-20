# -*- coding: utf-8 -*-

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

require "rake/testtask"
Rake::TestTask.new(:test) do |t|
  t.libs = ['test', 'lib']
  t.pattern = 'test/**/*_test.rb'
end
