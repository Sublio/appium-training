require 'rubygems'
require 'appium_lib'
require 'rest-client'
require 'chunky_png'
require_relative 'ChunkyImageCompareService'



  caps = Appium.load_appium_txt file: File.join(Dir.pwd, 'appium.txt') #get caps from external txt file



  # Start the driver
  @driver = Appium::Driver.new(caps)
  @driver.start_driver



module Dummy
  module IOS
    Appium.promote_singleton_appium_methods Dummy

    screenshot("/Users/denis/Projects/Appium/Training/appium-training/1.png")

    textField = textfields
    buttonsAll = buttons
    textSum = first_text
    textField[0].type("1")
    textField[1].type("2")

    sumButton = find_element(:name =>"Compute Sum")
    sumButton.click

    puts textSum.text

    doneButton = find_element(:name => "Done")
    doneButton.click()
    sleep(2)

    screenshot("/Users/denis/Projects/Appium/Training/appium-training/2.png")

    ChunkyImageCompareService.compareTwoImages("1.png", "2.png")

    driver_quit

  end
end