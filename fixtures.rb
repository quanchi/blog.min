#!/usr/bin/env ruby

require "sequel"
require "yaml"

DB = Sequel.sqlite("blog.db")

dataset = DB[:posts]

10.times do |i|
  dataset.insert(:title => "Title #{i}", :body => "Lorem ipsum dolor sit amet, \n\n```ruby\nrequire 'gem'\nputs 'dupa'\n```\nconsectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", :created_at => Time.now)
end

dataset = DB[:options]

config = YAML.load_file("blog.yml")
config.each_pair do |name, value|
  dataset.insert(:name => name, :value => value)
end
p config

