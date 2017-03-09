require 'rubygems'
require 'bundler'
require 'logger'

Bundler.require
require './app/my_app'
require './app/my_log'

logger = Logger.new('./my_app.log')

use Rack::CommonLogger, logger
use MyLoggerMiddleware, logger

run MyApp