require 'rubygems'
require 'appium_lib'
require 'test/unit'
require_relative 'Services/chunkyImageCompareService'
require_relative 'user_data_depot'


# For Launching test install Bundle and then "bundle install & bundle exec ruby login_tests_ios.rb"


class LoginTestsIos < Test::Unit::TestCase

  def setup

    caps = Appium.load_appium_txt file: File.join(Dir.pwd, 'appiumIOSCaps.txt')

    driver = Appium::Driver.new(caps)
    Appium.promote_appium_methods self.class
    driver.start_driver

  end


  def teardown
    driver_quit
  end



  def testLoginWithMail

    loginButton = find_element(:name, 'ACCESS WITH EMAIL')
    loginButton.click
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

    wait {  button('Home')  }

    end
end