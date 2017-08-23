require 'appium_lib'

# bottom navigation bar page class

class BOTTOM_NAV_BAR
  attr_accessor :driver

  def initialize(driver)
    @driver = driver
    Appium.promote_appium_methods self.class
  end

  def homeButton

    if @driver.device_is_android?

      @driver.find_element(:id, 'com.thetrustedinsight.tiapp:id/bottomBarItemOne')

    else

      @driver.find_element(:id, 'Home')

    end
  end

  def bookmarksButton
    sleep(1)

    if @driver.device_is_android?

      @driver.find_element(:id, 'com.thetrustedinsight.tiapp:id/bottomBarItemTwo')

    else

      @driver.find_element(:id, 'Bookmarks')

    end
  end

  def contactsButton

    if @driver.device_is_android?

      @driver.find_element(:id, 'com.thetrustedinsight.tiapp:id/bottomBarItemThree')

    else
      @driver.find_element(:id, 'Contacts')

    end
  end

  def notificationsButton
    if @driver.device_is_android?

      @driver.find_element(:id, 'com.thetrustedinsight.tiapp:id/bottomBarItemFour')

    else

      @driver.find_element(:id, 'Notifications')

    end
  end

  def settingsButton
    if @driver.device_is_android?

      @driver.find_element(:id, 'com.thetrustedinsight.tiapp:id/bottomBarItemFive')

    else

      @driver.find_element(:id, 'Settings')

    end
  end
end
