require 'rubygems'
require 'appium_lib'
require 'test/unit'
require 'rest-client'
require 'nokogiri'
require 'require_all'
require_relative '../user_data_depot'
require_all 'pages'
require_all 'services'

class LoginTestsIos < Test::Unit::TestCase
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

  end

  def teardown
    @driver.driver_quit
  end

  def testLoginWithMail(mail = 'sublio@rambler.ru', pass = 'avatar1260')
    welcomePage = WELCOME_PAGE.new(driver)
    welcomePage.loginWithEmailButton.click
    loginPage = ENTER_EMAIL_PAGE.new(driver)
    loginPage.emailField.type mail
    sleep 2
    loginPage.nextButton.click
    passwordPage = ENTER_PASS_PAGE.new(driver)
    sleep 2
    passwordPage.passField.type pass

    passwordPage.nextButton.click

    homePage = HOME.new(driver)

    wait { homePage.searchButton.displayed? }

    homePage.enableNotificationsIfNeeded
  end

  def testLogoutFromCurrentAccount
    testLoginWithMail

    bottombar = BOTTOM_NAV_BAR.new(@driver)

    wait { bottombar.settingsButton.displayed? }
    bottombar.settingsButton.click

    table = SETTINGS_PAGE.new(@driver).tableContainer

    if @driver.device_is_android?

      swipe(start_x: 75, start_y: 500, end_x: 75, end_y: 20, duration: 500)

    else

      scroll direction: 'down', element: table

    end

    text('Log out').click

    wait { text 'Welcome' }
  end


  ############## Shared methods section ##########################

  def loginWithMail(mail = 'sublio@rambler.ru', pass = 'avatar1260')
    welcomePage = WELCOME_PAGE.new(@driver)
    welcomePage.loginWithEmailButton.click
    loginPage = ENTER_EMAIL_PAGE.new(@driver)
    loginPage.emailField.type mail
    loginPage.nextButton.click
    sleep (5)
    passwordPage = ENTER_PASS_PAGE.new(@driver)

    passwordPage.passField.type pass

    passwordPage.nextButton.click

    sleep 10

    homePage = HOME.new(@driver)

    sleep 10

    homePage.enableNotificationsIfNeeded
  end
end
