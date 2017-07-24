require 'rubygems'
require 'appium_lib'
require_relative '../../appium-training/login_tests'

module GoogleLoginer


  def self.loginWithGoogleAccount(email, password)


    wait { text 'Choose an account' }

    if ( exists { button ('George Irvin test.device@rosberry.com')})

      find_element(:xpath, "//XCUIElementTypeButton[@name=\"George Irvin test.device@rosberry.com\"]").click
      wait { button('ALLOW').click }
      sleep(4)

    else

        #get first textField
        textField.type email
        button('NEXT').click
        textField.type password
        button('NEXT').click

        wait { button('ALLOW').click }
        sleep 4

    end

    end


  end
