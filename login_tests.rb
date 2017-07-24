require 'rubygems'
require 'appium_lib'
require 'test/unit'
require 'rest-client'
require 'nokogiri'
require_relative 'Services/chunkyImageCompareService'
require_relative 'Services/google_acc_loginer'
require_relative 'user_data_depot'
require_relative 'pages/welcome_page'


class LoginTestsIos < Test::Unit::TestCase

  attr_reader :driver

  if ARGV.include? 'android'

    @@platform = 'android'
  else
    @@platform = 'ios'
  end


  def setup

    if @@platform == 'android'
      puts 'android caps has been loaded'
      caps = Appium.load_appium_txt file: File.join(Dir.pwd, 'caps/appiumAndroidCaps.txt')
    else
      puts 'ios caps has been loaded'
      caps = Appium.load_appium_txt file: File.join(Dir.pwd, 'caps/appiumiOSCaps.txt')
    end

    @driver = Appium::Driver.new(caps)
    Appium.promote_appium_methods self.class
    @driver.start_driver

  end


  def teardown
    @driver.driver_quit
  end

  def testLoginWithMail

    welcomePage = WELCOME_PAGE.new(@driver)
    welcomePage.loginButton.click
  end
=begin
    loginTextField = textfields[0]
    loginTextField.type UserDataDepot.arrayOfValidMailsPasswords[0]['mail']
    nextButton = find_element(:name, 'NEXT')
    nextButton.click
    wait { text('Welcome Denis!') }
    passwordTextField = textfields[0]
    passwordTextField.type UserDataDepot.arrayOfValidMailsPasswords[0]['password']
    loginButton = find_element(:name, 'LOG IN')
    loginButton.click

    sleep(3)

    if (buttons[0].label == "ENABLE NOTIFICATIONS")

        buttons[0].click

    end

    buttons[1].click #fire for system alert handler

    sleep(1)

    begin
      topTextLogo_displayed = find_element(:name,"imgTopLogoTxt").displayed?
    rescue
      topTextLogo_displayed = false
    end

    assert(topTextLogo_displayed)

  end

  def testLogoutFromCurrentAccount

    testLoginWithMail
    wait { button 'Settings' }
    find_element(:xpath, "//XCUIElementTypeButton[@name=\"Settings\"]").click

    table = find_ele_by_attr('XCUIElementTypeTable', 'type','XCUIElementTypeTable')

    while !exists {text('Log out')} do

      scroll direction: "down", element:table

    end

    text("Log out").click

    wait { text 'Welcome to Trusted Insight' }

  end
=end
end