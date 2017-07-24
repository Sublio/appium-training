require 'rubygems'
require 'appium_lib'
require 'test/unit'
require 'rest-client'
require 'nokogiri'
require 'require_all'
require_relative 'user_data_depot'
require_all 'pages'
require_all 'Services'



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
    welcomePage.loginWithEmailButton.click
    loginPage = ENTER_EMAIL_PAGE.new(@driver)
    loginPage.emailField.type UserDataDepot.arrayOfValidMailsPasswords[0]['mail']
    sleep 2
    loginPage.nextButton.click
    passwordPage = ENTER_PASS_PAGE.new(@driver)
    sleep 1
    passwordPage.passField.type UserDataDepot.arrayOfValidMailsPasswords[0]['password']

    passwordPage.nextButton.click

    homePage = HOME.new(@driver)

    wait { button homePage.searchButton }


  end
=begin

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

    while !r {text('Log out')} do

      scroll direction: "down", element:table

    end

    text("Log out").click

    wait { text 'Welcome to Trusted Insight' }

  end
=end
end