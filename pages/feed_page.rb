class FEED
  attr_accessor :driver

  def initialize(driver)
    @driver = driver
    Appium.promote_appium_methods self.class
  end

  def table
    if device_is_android?

      find_element(:id, 'com.thetrustedinsight.tiapp:id/recycler')
    else

     find_element(:class_name, 'XCUIElementTypeTable')

    end
  end

  def cells
    if device_is_android?

      #TODO!!!
    else

      find_elements(:class_name, 'XCUIElementTypeCell')

    end
  end

  def searchButton

    if device_is_android?

      find_element(:id, 'com.thetrustedinsight.tiapp:id/op_search')
    else

      find_elements(:id, 'iconNavSearch')

    end


  end

  def navBarLabel

    if device_is_android?

      find_element(:id, 'com.thetrustedinsight.tiapp:id/toolbar').find_element(:class_name, 'android.widget.ImageView')
    else

      find_elements(:id, 'imgTopLogoTxt')

    end


  end


  def newInsights

    if device_is_android?

      #TODO Find locators for Android case
    else

      find_elements(:id, 'New insights')

    end

  end


end