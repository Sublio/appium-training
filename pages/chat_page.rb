
class CHAT_PAGE

  attr_accessor :driver


  def initialize(driver)
    @driver = driver
    #Appium.promote_appium_methods self.class
  end


  def textField
    if @driver.device_is_android?

      @driver.find_element(:id, 'com.thetrustedinsight.tiapp:id/chat_input_e')

    else

      @driver.find_element(:accessibility_id, 'Write a message...')
    end
  end

  def sendButton

    if @driver.device_is_android?

      @driver.find_element(:id, 'com.thetrustedinsight.tiapp:id/chat_send_i')

    else

      @driver.find_element(:id, 'iconSendMessage')
    end
  end

  def addContentButton
    if @driver.device_is_android?

       @driver.find_element(:id, 'com.thetrustedinsight.tiapp:id/chat_add_content_i')

    else

      @driver.find_element(:id, 'iconAddContent')
    end

  end

  def topPlusButton
    if @driver.device_is_android?

      @driver.find_element(:id, 'com.thetrustedinsight.tiapp:id/op_settings')

    else

      @driver.find_element(:id, 'iconTopAdd')
    end

  end

  def backButton
    if @driver.device_is_android?

      @driver.find_element(:id, 'Navigate up')

    else

      @driver.find_element(:id, 'iconTopBack')
    end

  end

  def chatTitle
    if @driver.device_is_android?

      @driver.find_element(:id, 'com.thetrustedinsight.tiapp:id/chat_name')

    else

      @driver.find_element(:class_name, 'XCUIElementTypeNavigationBar').find_elements(:class_name, 'XCUIElementTypeStaticText').first
    end

  end


  def chatSubtitle

    if @driver.device_is_android?

      @driver.find_element(:id, 'com.thetrustedinsight.tiapp:id/chat_subtitle')

    else

      @driver.find_element(:class_name, 'XCUIElementTypeNavigationBar').find_elements(:class_name, 'XCUIElementTypeStaticText')[1]
    end

  end
end