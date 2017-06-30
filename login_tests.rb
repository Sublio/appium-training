require 'rubygems'
require 'appium_lib'
require 'test/unit'
require_relative 'ChunkyImageCompareService'


# For Launching test install Bundle and then "bundle install & bundle exec ruby login_tests.rb"


  caps = Appium.load_appium_txt file: File.join(Dir.pwd, 'appiumiOSCaps.txt') #get caps from external txt file


class LoginTests < Test::Unit::TestCase



  def setup

    caps = Appium.load_appium_txt file: File.join(Dir.pwd, 'appiumiOSCaps.txt')

    driver = Appium::Driver.new(caps)
    Appium.promote_appium_methods self.class
    driver.start_driver

  end


  def teardown
    driver_quit
  end



  def testMethod
    #button(1).click
    assert(exists { button('ACCESS WITH EMAIL') } , "There is no button")

  end

  def testMethod2
    button(1).click
  end



end