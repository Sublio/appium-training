require 'rubygems'
require 'appium_lib'
require 'test/unit'
require 'rest-client'
require 'nokogiri'
require 'require_all'
require_relative 'user_data_depot'
require_all 'pages'
require_all 'services'

class FeedTests < Test::Unit::TestCase
  attr_reader :driver

  @@platform = if ARGV.include? 'android'

                 'android'
               else
                 'ios'
               end

  def setup
    if @@platform == 'android'
      caps = Appium.load_appium_txt file: File.join(Dir.pwd, 'caps/appiumAndroidCaps.txt')
    else
      caps = Appium.load_appium_txt file: File.join(Dir.pwd, 'caps/appiumiOSCaps.txt')
    end

    @driver = Appium::Driver.new(caps)
    Appium.promote_appium_methods self.class
    @driver.start_driver
  end

  def teardown
    @driver.driver_quit
  end


  def testReportFirstCellFromFeed

    


  end


end