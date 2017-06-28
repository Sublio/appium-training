require 'rubygems'
require 'appium_lib'



APP_PATH = 'http://appium.github.io/appium/assets/TestApp7.1.app.zip'



desired_capsIos = {
    caps:       {
        platformName:  'iOS',
        platformVersion: '10.3',
        deviceName:    'iPhone 6',
        app:           APP_PATH,
        automationName: "XCUITest",
        language: 'en'
    }
}



  # Start the driver
  driver = Appium::Driver.new(desired_capsIos);
  driver.start_driver;
  sleep(2);

  #quit the driver
  driver.driver_quit;


module Dummy




end