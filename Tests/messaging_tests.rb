require 'rubygems'
require 'appium_lib'
require 'test/unit'
require 'faker'
require 'require_all'
require_relative '../services/loginer'
require_relative '../../appium-training/user_data_depot'
require_relative '../../appium-training/pages/bottom_nav_bar_page'
Dir['/pages/*.rb'].each {|file| require file }
Dir['/services/*.rb'].each {|file| require file }

class Messaging < Test::Unit::TestCase
  attr_reader :driver
  def setup

    userLeon = UserDataDepot.arrayOfValidMailsPasswords[2]
    userJohn = UserDataDepot.arrayOfValidMailsPasswords.last
    capsIOS = Appium.load_appium_txt file: File.join(Dir.pwd, 'caps/appiumiOSCaps.txt')
    capsAndroid = Appium.load_appium_txt file: File.join(Dir.pwd, 'caps/appiumAndroidCaps.txt')

    @@driverIos = Appium::Driver.new(capsIOS, global_driver = true)
    @@driverAndroid = Appium::Driver.new(capsAndroid, global_driver = true)
    @@driverIos.start_driver
    sleep 1
    @@driverAndroid.start_driver
    Loginer.new.loginWithMailPassUsingDriver(userLeon['mail'], userLeon['password'], @@driverIos)
    Loginer.new.loginWithMailPassUsingDriver(userJohn['mail'], userJohn['password'], @@driverAndroid)
  end

  def teardown
    @@driverIos.driver_quit
    @@driverAndroid.driver_quit
  end

  def testSendMessageFromUserOneToUserTwo
    #using John-appleseed fake account for ios
    #using Leon Kennedy fake account for Android

    phrase1 = Faker::HarryPotter.quote #phrase for user Leon
    phrase2 = Faker::HarryPotter.quote #phrase for user John

    bottomNavBarIos = BOTTOM_NAV_BAR.new(@@driverIos)
    bottomNavBarIos.contactsButton.click
    bottomNavBarAndroid = BOTTOM_NAV_BAR.new(@@driverAndroid)
    bottomNavBarAndroid.contactsButton.click

  end

end
