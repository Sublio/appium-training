require 'rubygems'
require 'appium_lib'
require 'test/unit'
require_relative '../services/loginer'
require_relative '../../appium-training/user_data_depot'
Dir["/pages/*.rb"].each {|file| require file }
Dir["/services/*.rb"].each {|file| require file }

class Messaging < Test::Unit::TestCase
  attr_reader :driver
  def setup

    userLeon = UserDataDepot.arrayOfValidMailsPasswords[2]
    userDenis = UserDataDepot.arrayOfValidMailsPasswords[0]
    capsIOS = Appium.load_appium_txt file: File.join(Dir.pwd, 'caps/appiumiOSCaps.txt')
    capsAndroid = Appium.load_appium_txt file: File.join(Dir.pwd, 'caps/appiumAndroidCaps.txt')
    #Appium.promote_appium_methods self.class

    @driverIos = Appium::Driver.new(capsIOS, global_driver = true)
    @driverAndroid = Appium::Driver.new(capsAndroid, global_driver = true)
    @driverIos.start_driver
    sleep 2
    @driverAndroid.start_driver
    Loginer.new.loginWithMailPassUsingDriver(userLeon['mail'], userLeon['password'], @driverIos)
    Loginer.new.loginWithMailPassUsingDriver(userDenis['mail'], userDenis['password'], @driverAndroid)
  end

  def teardown
    @driverIos.driver_quit
    @driverAndroid.driver_quit
  end

  def testSendMessageFromUserOneToUserTwo
    puts "Hey"

  end

end
