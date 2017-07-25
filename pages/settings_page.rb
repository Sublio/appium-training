
class SETTINGS_PAGE


  def initialize (driver)
    @driver = driver
    Appium.promote_appium_methods self.class

  end


  def tableContainer


    if @driver.device_is_android?

      @driver.find_element(:id, 'com.thetrustedinsight.tiapp:id/settings_scroll_container')

    else

      @driver.find_element(:class_name, 'XCUIElementTypeTable')

    end

  end

end