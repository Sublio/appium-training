require 'rubygems'
require 'appium_lib'
require 'test/unit'
require 'faker'
require_relative '../services/loginer'
require_relative '../../appium-training/user_data_depot'
require_relative '../../appium-training/pages/bottom_nav_bar_page'
require_relative '../../appium-training/pages/message_page'
require_relative '../../appium-training/pages/chat_page'

class Messaging < Test::Unit::TestCase
  attr_reader :driver
  def setup

    userLeon = UserDataDepot.arrayOfValidMailsPasswords[2]
    userJohn = UserDataDepot.arrayOfValidMailsPasswords.last
    capsIOS = Appium.load_appium_txt file: File.join(Dir.pwd, 'caps/appiumiOSCaps.txt')
    capsAndroid = Appium.load_appium_txt file: File.join(Dir.pwd, 'caps/appiumAndroidCaps.txt')

    @@driverIos = Appium::Driver.new(capsIOS, global_driver = true)
    @@driverAndroid = Appium::Driver.new(capsAndroid, global_driver = true)
    @@driverIos.start_driver
    sleep 1
    @@driverAndroid.start_driver
    Loginer.new.loginWithMailPassUsingDriver(userLeon['mail'], userLeon['password'], @@driverIos)
    Loginer.new.loginWithMailPassUsingDriver(userJohn['mail'], userJohn['password'], @@driverAndroid)
  end

  def teardown
    @@driverIos.driver_quit
    @@driverAndroid.driver_quit
  end

  def testSendMessageFromUserOneToUserTwo
    #using John-appleseed fake account for ios
    #using Leon Kennedy fake account for Android
    bottomNavBarIos = BOTTOM_NAV_BAR.new(@@driverIos)
    bottomNavBarIos.contactsButton.click
    bottomNavBarAndroid = BOTTOM_NAV_BAR.new(@@driverAndroid)
    bottomNavBarAndroid.contactsButton.click
    messagePageIOS = MESSAGE_PAGE.new(@@driverIos)

    cellJohn = @@driverIos.texts('John Appleseed').first
    if (cellJohn.displayed?)
      cellJohn.click
    else
      fail 'There is no cell visible'
    end

    cellLeon = @@driverAndroid.texts('Leon Kennedy').first
    if (cellLeon.displayed?)
      cellLeon.click
    else
      fail 'There is no cell visible'
    end

    sleep(2)

    chatPageAndroid = CHAT_PAGE.new(@@driverAndroid)

    phrase1 = Faker::HarryPotter.quote #phrase for user Leon
    sleep 2
    chatPageAndroid.textField.send_keys(phrase1)
    sleep 1
    chatPageAndroid.sendButton.click
    sleep (2)
    puts 'Checking ios side for received message'

    texts = @@driverIos.find_elements(:class_name, 'XCUIElementTypeTextView')
    found = 0
    for text in texts

      if text.text == phrase1
        puts 'Cool we found it'
        found +=1
      end
    end

    if found == 0
      fail('We are cant find sended message')
    end

  end


  def testsendMessageFromUserTwoToUserOne
    bottomNavBarIos = BOTTOM_NAV_BAR.new(@@driverIos)
    bottomNavBarIos.contactsButton.click
    bottomNavBarAndroid = BOTTOM_NAV_BAR.new(@@driverAndroid)
    bottomNavBarAndroid.contactsButton.click
    cellJohn = @@driverIos.texts('John Appleseed').first
    if (cellJohn.displayed?)
      cellJohn.click
    else
      fail 'There is no cell visible'
    end

    cellLeon = @@driverAndroid.texts('Leon Kennedy').first
    if (cellLeon.displayed?)
      cellLeon.click
    else
      fail 'There is no cell visible'
    end

    sleep(2)

    chatPageiOS = CHAT_PAGE.new(@@driverIos)

    phrase1 = Faker::HarryPotter.quote #phrase for user Leon
    sleep 2
    puts "before chat page"
    chatPageiOS.textField.send_keys(phrase1)
    sleep 1
    chatPageiOS.sendButton.click
    sleep (2)
    puts 'Checking android side for received message'

    texts = @@driverAndroid.find_elements(:class_name, 'android.widget.TextView')
    found = 0
    for text in texts

      if text.text == phrase1
        puts 'Cool we found it'
        found +=1
      end
    end

    if found == 0
      fail('We are cant find sended message')
    end
  end
end
