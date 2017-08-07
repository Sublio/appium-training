require 'rubygems'
require 'appium_lib'
require 'test/unit'
require 'rest-client'
require 'nokogiri'
require 'require_all'
require_relative 'user_data_depot'
require_relative 'login_tests'
require_all 'pages'
require_all 'services'

class FeedTests < Test::Unit::TestCase
  attr_reader :driver

  @@platform = if ARGV.include? 'android'

                 'android'
               else
                 'ios'
               end

  def setup
    if @@platform == 'android'
      caps = Appium.load_appium_txt file: File.join(Dir.pwd, 'caps/appiumAndroidCaps.txt')
    else
      caps = Appium.load_appium_txt file: File.join(Dir.pwd, 'caps/appiumiOSCaps.txt')
    end

    @driver = Appium::Driver.new(caps)
    Appium.promote_appium_methods self.class
    @driver.start_driver

    loginWithMail

  end



  def teardown
    @driver.driver_quit
  end


  def testReportFirstCellFromFeed()

    feed = FEED.new(@driver)

    wait { feed.searchButton.displayed? }

    feed.swipeLeftOnCellByIndex(0)


  end



  private
  def loginWithMail(mail = 'sublio@rambler.ru', pass = 'avatar1260')
    welcomePage = WELCOME_PAGE.new(@driver)
    welcomePage.loginWithEmailButton.click
    loginPage = ENTER_EMAIL_PAGE.new(@driver)
    loginPage.emailField.type mail
    sleep 2
    loginPage.nextButton.click
    passwordPage = ENTER_PASS_PAGE.new(@driver)
    sleep 2
    passwordPage.passField.type pass

    passwordPage.nextButton.click

    homePage = HOME.new(@driver)

    wait { homePage.searchButton.displayed? }

    homePage.enableNotificationsIfNeeded
  end


end