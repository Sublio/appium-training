require 'rubygems'
require 'appium_lib'
require 'test/unit'
require 'rest-client'
require 'nokogiri'
require 'require_all'
require 'rspec-expectations'
require_relative 'user_data_depot'
require_relative 'login_tests'
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
    puts 'feed_tests'
    if @@platform == 'android'
      caps = Appium.load_appium_txt file: File.join(Dir.pwd, 'caps/appiumAndroidCaps.txt')
    else
      caps = Appium.load_appium_txt file: File.join(Dir.pwd, 'caps/appiumiOSCaps.txt')
    end

    @driver = Appium::Driver.new(caps)
    Appium.promote_appium_methods self.class
    @driver.start_driver

    login = LoginTestsIos.new(@driver)
    login.loginWithMail
  end

  def teardown
    @driver.driver_quit
  end

  def testReportFirstCellFromFeed
    feed = FEED.new(@driver)

    wait { feed.searchButton.displayed? }

    feed.swipeRightOnCellByIndex 0 #unfortunately only first cell from feed for now :()

    if device_is_android?

      feed.reportButton.click
    else

      action = Appium::TouchAction.new.tap(x: 39, y: 99)
      action.perform
    end
  end
end
