# enter pass page

class ENTER_PASS_PAGE
  attr_accessor :driver

  def initialize(driver)
    @driver = driver
  end

  def passField
    @driver.textfields[0]
  end

  def nextButton
    if @driver.device_is_android?

      driver.find_element(:id, 'com.thetrustedinsight.tiapp:id/join_ab_next')

    else

      @driver.find_element(:name, 'LOG IN')

    end
  end

  def forgotPassButton; end
end
