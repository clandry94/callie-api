require 'sinatra/cross_origin'
require 'rubygems'
require 'bundler'
require 'redis'
Bundler.require

require './callie.rb'

$REDIS = Redis.new(url: ENV["REDIS_URL"])

run Callie
