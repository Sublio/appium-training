
class BOOKMARKS_PAGE
  attr_accessor :driver

  def initialize(driver)
    @driver = driver
    Appium.promote_appium_methods self.class
  end

  def bookmarks
    if @driver.device_is_android?

      @driver.find_element(:id, 'com.thetrustedinsight.tiapp:id/bookmarks_container').find_elements(:class_name, 'android.widget.RelativeLayout') #return only visible relative layouts

    else

      @driver.find_elements(:class_name, 'XCUIElementTypeCell')

    end
  end

  def bookmarksTypes

    if @driver.device_is_android?

      @driver.find_element(:id, 'com.thetrustedinsight.tiapp:id/bookmarks_filters_container').find_elements(:class_name, 'android.widget.RelativeLayout') #return only visible relative layouts

    else

      @driver.find_element(:id, 'TITabBarView').find_element(:class_name, 'XCUIElementTypeButton')
      sleep(1)
      @driver.find_elements(:class_name, 'XCUIElementTypeSheet').find_elements(:class_name, 'XCUIElementTypeButton')

    end


  end

  def table
    if @driver.device_is_android?

      @driver.find_element(:id, 'com.thetrustedinsight.tiapp:id/bookmarks_container')

    else

      @driver.find_element(:class_name, 'XCUIElementTypeTable')

    end
  end

  def bookmarksFilterContainer
    if @driver.device_is_android?


      @driver.find_element(:id, 'com.thetrustedinsight.tiapp:id/bookmarks_filters_container')

    else

      @driver.find_element(:xpath, '//XCUIElementTypeNavigationBar[@name="TITabBarView"]/XCUIElementTypeOther').click
      sleep(1)
      @driver.find_element(:class_name, 'XCUIElementTypeSheet')

    end
  end

  def noBookmarksLabel


    if @driver.device_is_android?

      text('No bookmarks added yet')

    else

      @driver.find_element(:id, 'No bookmarks added yet')

    end


  end
end
