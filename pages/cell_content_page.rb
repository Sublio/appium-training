
class CELLCONTENT_PAGE
  attr_accessor :driver

  def initialize(driver)
    @driver = driver
    Appium.promote_appium_methods self.class
  end

  def backButton
    if @driver.device_is_android?

      @driver.find_element(:id, 'Navigate up')

    else

      wait { @driver.find_element(:name, 'iconTopBack') }

    end
  end

  def addToBookmarkButton
    if @driver.device_is_android? # case android

      wait { @driver.find_element(:id, 'com.thetrustedinsight.tiapp:id/op_bookmark') }

    else # case ios

      wait { @driver.find_element(:name, 'iconNavBookmarkEmpty') }

    end
  end


  def removeBookmarkButton

    if @driver.device_is_android? # case android

      wait { @driver.find_element(:id, 'com.thetrustedinsight.tiapp:id/op_bookmark') }

    else # case ios

      wait { @driver.find_element(:name, 'iconNavBookmarkFull') }

    end


  end

  def topNavigationBar; end
end
