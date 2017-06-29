require 'rubygems'
require 'appium_lib'
require 'rest-client'



  caps = Appium.load_appium_txt file: File.join(Dir.pwd, 'appium.txt') #get caps from external txt file



  # Start the driver
  @driver = Appium::Driver.new(caps)
  @driver.start_driver



module Dummy
  module IOS
    Appium.promote_singleton_appium_methods Dummy



    textField = textfields
    buttonsAll = buttons
    textSum = first_text
    textField[0].type("1")
    textField[1].type("2")

    sumButton = find_element(:name =>"Compute Sum")
    sumButton.click

    puts textSum.text

    raise Exception, "Bitch please" if textSum.text != "3"

    #driver_quit
    x

  end
end