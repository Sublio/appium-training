require 'rubygems'
require 'appium_lib'
require 'test/unit'
require 'require_all'
require_relative 'login_tests.rb'
require_all 'pages'
require_all 'services'

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
    #begin logining ios driver
    @driverIos.find_element(:name, 'ACCESS WITH EMAIL').click
    @driverIos.find_element(:class_name, 'XCUIElementTypeTextField').type(userLeon['mail'])
    @driverIos.find_element(:name, 'NEXT').click
    sleep 2
    @driverIos.find_element(:class_name, 'XCUIElementTypeSecureTextField').type(userLeon['password'])
    @driverIos.find_element(:name, 'LOG IN').click
    sleep 10

    buttons = @driverIos.find_elements(:class_name, 'XCUIElementTypeButton')

    if buttons[0].label == 'ENABLE NOTIFICATIONS'

      buttons[0].click
      sleep 2
      @driverIos.find_elements(:class_name, 'XCUIElementTypeButton')[1].click # OK button on permission alert

    end

   #begin login android driver

    @driverAndroid.text('ACCESS WITH EMAIL').click
    @driverAndroid.textfields.first.type(userDenis['mail'])
    @driverAndroid.find_element(:id, 'com.thetrustedinsight.tiapp:id/join_ab_next').click
    sleep(2)
    @driverAndroid.textfields.first.type(userDenis['password'])
    @driverAndroid.find_element(:id, 'com.thetrustedinsight.tiapp:id/join_ab_next').click
    sleep(5)
  end

  def teardown
    @driverIos.driver_quit
    @driverAndroid.driver_quit

  end

  def testSendMessageFromUserOneToUserTwo
    puts "Hey"

  end

end
