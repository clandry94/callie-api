require 'rubygems'
require 'bundler'
require 'redis'
Bundler.require

require './callie.rb'

$REDIS = Redis.new

run Callie
