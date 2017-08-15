
class REPORT_PAGE

  attr_accessor :driver

  def initialize(driver)
    @driver = driver
    Appium.promote_appium_methods self.class
  end


  def closeButton

    if device_is_android?

      find_element(:id, 'Navigate up')

    else

      find_element(:id, 'iconTopCancel')

    end
  end

  def reportStaticText

    if device_is_android?

      find_elements(:class_name, 'android.widget.TextView')[1]

    else

      find_element(:id, 'Why are you issuing this report?')

    end

  end

  def textField
    if device_is_android?

      find_element(:id, 'com.thetrustedinsight.tiapp:id/et_report')

    else

      find_element(:class_name, 'XCUIElementTypeTextView')

    end

  end

  def sendButton
    if device_is_android?

      find_element(:id, 'com.thetrustedinsight.tiapp:id/btn_report')

    else

      find_element(:id, 'SEND REPORT')

    end

  end

end