
class CHAT_PAGE

  attr_accessor :driver


  def initialize(driver)
    @driver = driver
    Appium.promote_appium_methods self.class
  end


  def textField
    if device_is_android?

      find_element(:id, 'com.thetrustedinsight.tiapp:id/chat_input_e')

    else

      find_element(:class_name, 'XCUIElementTypeTextView')
    end
  end

  def sendButton

    if device_is_android?

      find_element(:id, 'com.thetrustedinsight.tiapp:id/chat_send_i')

    else

      find_element(:id, 'iconSendMessage')
    end
  end

  def addContentButton
    if device_is_android?

      find_element(:id, 'com.thetrustedinsight.tiapp:id/chat_add_content_i')

    else

      find_element(:id, 'iconAddContent')
    end

  end

  def topPlusButton
    if device_is_android?

      find_element(:id, 'com.thetrustedinsight.tiapp:id/op_settings')

    else

      find_element(:id, 'iconTopAdd')
    end

  end

  def backButton
    if device_is_android?

      find_element(:id, 'Navigate up')

    else

      find_element(:id, 'iconTopBack')
    end

  end

  def chatTitle
    if device_is_android?

      find_element(:id, 'com.thetrustedinsight.tiapp:id/chat_name')

    else

      find_element(:class_name, 'XCUIElementTypeNavigationBar').find_elements(:class_name, 'XCUIElementTypeStaticText').first
    end

  end


  def chatSubtitle

    if device_is_android?

      find_element(:id, 'com.thetrustedinsight.tiapp:id/chat_subtitle')

    else

      find_element(:class_name, 'XCUIElementTypeNavigationBar').find_elements(:class_name, 'XCUIElementTypeStaticText')[1]
    end

  end
end