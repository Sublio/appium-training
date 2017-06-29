require 'rubygems'
require 'appium_lib'
require 'rest-client'



caps = Appium.load_appium_txt file: File.join(Dir.pwd, 'appium.txt') #get caps from external txt file


  # Start the driver
  @driver = Appium::Driver.new(caps)
  @driver.start_driver

  sleep(2);


module Dummy
  module IOS
    Appium.promote_singleton_appium_methods Dummy

    buttonsAll = buttons
    
    buttonsAll[1].click()

    puts server_url
    exists { buttonsAll[1]} ? puts('true') : puts('false')

    puts ios_version

    #driver_quit
    x
  end
end