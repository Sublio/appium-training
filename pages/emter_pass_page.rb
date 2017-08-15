# enter pass page

class ENTER_PASS_PAGE
  attr_accessor :driver

  def initialize(driver)
    @driver = driver
    Appium.promote_appium_methods self.class
  end

  def passField
    textfields[0]
  end

  def nextButton
    if device_is_android?

      find_element(:id, 'com.thetrustedinsight.tiapp:id/join_ab_next')

    else

      find_element(:name, 'LOG IN')

    end
  end

  def forgotPassButton; end
end
