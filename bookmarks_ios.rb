require 'rubygems'
require 'appium_lib'
require 'test/unit'


class BookmarksiOS < Test::Unit::TestCase

  def setup

    caps = Appium.load_appium_txt file: File.join(Dir.pwd, 'appiumIOSCaps.txt')

    driver = Appium::Driver.new(caps)
    Appium.promote_appium_methods self.class
    driver.start_driver

  end


  def teardown
    driver_quit
  end


  def testAddBookmark


  end

end