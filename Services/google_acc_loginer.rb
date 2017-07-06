require 'rubygems'
require 'appium_lib'

class GoogleLoginer


  Appium.promote_appium_methods self.class

  def self.loginWithGoogleAccount(email, password)

=begin
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

=end
  end