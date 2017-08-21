require 'rubygems'
require 'appium_lib'
require 'test/unit'
require 'require_all'
require_relative 'login_tests'
require_all 'pages'
require_all 'services'

class Messaging < Test::Unit::TestCase
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

    if @@platform == 'android1'
      caps = Appium.load_appium_txt file: File.join(Dir.pwd, 'caps/appiumAndroidCaps1.txt')
    elsif @@platform == 'android2'
      caps = Appium.load_appium_txt file: File.join(Dir.pwd, 'caps/appiumAndroidCaps2.txt')
    elsif @@platform == 'android'
      caps = Appium.load_appium_txt file: File.join(Dir.pwd, 'caps/appiumAndroidCaps.txt')
    else
      caps = Appium.load_appium_txt file: File.join(Dir.pwd, 'caps/appiumiOSCaps.txt')
    end

    @driver = Appium::Driver.new(caps, global_driver = true)
    Appium.promote_appium_methods self.class
    @driver.start_driver

    LoginTestsIos.new(@driver).loginWithMail #login before each test in this class
  end

  def teardown
    @driver_quit
  end


end
