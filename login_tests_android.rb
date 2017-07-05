require 'rubygems'
require 'appium_lib'
require 'test/unit'
require_relative 'Services/chunkyImageCompareService'
require_relative 'user_data_depot'


# For Launching test install Bundle and then "bundle install & bundle exec ruby login_tests_ios.rb"


class LoginTestsAndroid < Test::Unit::TestCase

  def setup

    caps = Appium.load_appium_txt file: File.join(Dir.pwd, 'appiumAndroidCaps.txt')

    driver = Appium::Driver.new(caps)
    Appium.promote_appium_methods self.class
    driver.start_driver

  end


  def teardown
    driver_quit
  end



  def testLoginWithMail

    find('ACCESS WITH EMAIL').click
    first_textfield.type UserDataDepot.arrayOfValidMailsPasswords[0]['mail']
    sleep(2)
    id('com.thetrustedinsight.tiapp:id/join_ab_next').click
    sleep(2)
    wait { text('Welcome Denis!') }
    first_textfield.type UserDataDepot.arrayOfValidMailsPasswords[0]['password']
    id('com.thetrustedinsight.tiapp:id/join_ab_next').click

    wait { text('TrustedInsight')} #wait for app fully loaded

  end
end