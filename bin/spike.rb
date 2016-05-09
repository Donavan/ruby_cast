#!/usr/bin/env ruby
require 'bundler/setup'
require 'ruby_cast'
require 'pry'

finder = RubyCast::ChromecastFinder.new

finder.find_chromecasts
sleep 1

binding.pry;2
puts 'here'