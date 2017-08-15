
# bottom navigation bar page class

class BOTTOM_NAV_BAR
  attr_accessor :driver

  def initialize(driver)
    @driver = driver
    Appium.promote_appium_methods self.class
  end

  def homeButton
    if device_is_android?

      find_element(:id, 'com.thetrustedinsight.tiapp:id/bottomBarItemOne')

    else

      find_element(:name, 'Home')

    end
  end

  def bookmarksButton
    sleep(1)

    if device_is_android?

      find_element(:id, 'com.thetrustedinsight.tiapp:id/bottomBarItemTwo')

    else

      find_element(:name, 'Bookmarks')

    end
  end

  def contactsButton
    if device_is_android?

      find_element(:id, 'com.thetrustedinsight.tiapp:id/bottomBarItemThree')

    else

      find_element(:name, 'Contacts')

    end
  end

  def notificationsButton
    if device_is_android?

      find_element(:id, 'com.thetrustedinsight.tiapp:id/bottomBarItemFour')

    else

      find_element(:name, 'Notifications')

    end
  end

  def settingsButton
    if device_is_android?

      find_element(:id, 'com.thetrustedinsight.tiapp:id/bottomBarItemFive')

    else

      find_element(:name, 'Settings')

    end
  end
end
