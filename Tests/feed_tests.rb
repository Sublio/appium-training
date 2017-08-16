require 'rubygems'
require 'appium_lib'
require 'test/unit'
require 'rest-client'
require 'nokogiri'
require 'require_all'
require 'rspec-expectations'
require_relative '../user_data_depot'
require_relative 'login_tests'
require_all 'pages'
require_all 'services'

class FeedTests < Test::Unit::TestCase
  attr_reader :driver

  @@platform = if ARGV.include? 'android1'
                 'android1'
               elsif ARGV.include? 'android2'
                 'android2'
               elsif ARGV.include? 'android'
                 'android'
               else
                 'ios'
               end


  def setup
    puts 'bookmarks test'

    if @@platform == 'android1'
      caps = Appium.load_appium_txt file: File.join(Dir.pwd, 'caps/appiumAndroidCaps1.txt')
    elsif @@platform == 'android2'
      caps = Appium.load_appium_txt file: File.join(Dir.pwd, 'caps/appiumAndroidCaps2.txt')
    elsif @@platform == 'android'
      caps = Appium.load_appium_txt file: File.join(Dir.pwd, 'caps/appiumAndroidCaps.txt')
    else
      caps = Appium.load_appium_txt file: File.join(Dir.pwd, 'caps/appiumiOSCaps.txt')
    end

    @driver = Appium::Driver.new(caps)
    Appium.promote_appium_methods self.class
    @driver.start_driver

    LoginTestsIos.new(@driver).loginWithMail
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

      action = Appium::TouchAction.new.tap(x: 39, y: 99) #this is a hankey, need to workaround for that
      action.perform

      reportPage = REPORT_PAGE.new (@driver)
      expect(reportPage.reportStaticText).to be_displayed
    end
  end
end
