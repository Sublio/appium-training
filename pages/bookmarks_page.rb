
class BOOKMARKS_PAGE

  attr_accessor :driver

  def initialize (driver)
    @driver = driver
  end

  def bookmarks

    if @driver.device_is_android?

      @driver.find_elements(:id, "com.thetrustedinsight.tiapp:id/bookmarks_container").find_elements(:class_name, "android.widget.RelativeLayout")

    else

      @driver.find_elements(:class_name, 'XCUIElementTypeCell')

    end

  end

  def bookmarksTypeDropdown

  end

  def table

    if @driver.device_is_android?

      @driver.find_element(:id, "com.thetrustedinsight.tiapp:id/bookmarks_container")

    else

      @driver.find_elements(:class_name, 'XCUIElementTypeTable')

    end


  end

  def bookmarksFilterContainer

    if @driver.device_is_android?

      @driver.find_element(:id, "com.thetrustedinsight.tiapp:id/bookmarks_filters_container")

    else

      @driver.find_element(:xpath, '//XCUIElementTypeNavigationBar[@name="TITabBarView"]/XCUIElementTypeOther').click
      sleep(1)
      @driver.find_element(:class_name, "XCUIElementTypeSheet")

    end
  end

end