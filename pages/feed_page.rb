class FEED
  attr_accessor :driver

  def initialize(driver)
    @driver = driver
    Appium.promote_appium_methods self.class
  end

  def table
    if @driver.device_is_android?

      @driver.find_element(:id, 'com.thetrustedinsight.tiapp:id/recycler')
    else

      @driver.find_element(:class_name, 'XCUIElementTypeTable')

    end
  end

  def cells
    if @driver.device_is_android?

        #TODO !!!
    else

      @driver.find_elements(:class_name, 'XCUIElementTypeCell')

    end
  end

  def searchButton

    if @driver.device_is_android?

      @driver.find_element(:id, 'com.thetrustedinsight.tiapp:id/op_search')
    else

      @driver.find_elements(:id, 'iconNavSearch')

    end


  end

  def navBarLabel

    if @driver.device_is_android?

      @driver.find_element(:id, 'com.thetrustedinsight.tiapp:id/toolbar').find_element(:class_name, 'android.widget.ImageView')
    else

      @driver.find_elements(:id, 'imgTopLogoTxt')

    end


  end


  def newInsights

    if @driver.device_is_android?

      #TODO Find locators for Android case
    else

      @driver.find_elements(:id, 'New insights')

    end

  end


end