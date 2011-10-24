require 'rubygems'
# require 'hpricot'
require 'jcode' if RUBY_VERSION < '1.9.1' #require 'jcode'

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
