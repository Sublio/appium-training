# user feed page

class HOME
  attr_accessor :driver

  def initialize(driver)
    @driver = driver
    Appium.promote_appium_methods self.class
  end

  def searchButton
    if device_is_android?

      find_element(:xpath, '//android.widget.TextView[@content-desc="Search"]')

    else

      find_element(:name, 'iconNavSearch')

    end
  end

  def cellFromFeedTableByIndex(index)
    if device_is_android?
      sleep 3
      cells = find_elements(:id, 'com.thetrustedinsight.tiapp:id/sml')
      table = find_element(:id, 'com.thetrustedinsight.tiapp:id/recycler')
      cells[index]

    else
      sleep(3)
      cells = find_elements(:class_name, 'XCUIElementTypeCell')
      table = find_element(:class_name, 'XCUIElementTypeTable')
      cells[index]

    end
  end

  def enableNotificationsIfNeeded
    unless device_is_android?

      if buttons[0].label == 'ENABLE NOTIFICATIONS'

        buttons[0].click
        sleep 2
        buttons[1].click # OK button on permission alert

      end

    end
  end
end
