
class CELLCONTENT_PAGE
  attr_accessor :driver

  def initialize(driver)
    @driver = driver
    Appium.promote_appium_methods self.class
  end

  def backButton
    if device_is_android?

       find_element(:id, 'Navigate up')

    else

      wait { find_element(:name, 'iconTopBack') }

    end
  end

  def addToBookmarkButton
    if device_is_android? # case android

      wait { find_element(:id, 'com.thetrustedinsight.tiapp:id/op_bookmark') }

    else # case ios

      wait { find_element(:name, 'iconNavBookmarkEmpty') }

    end
  end


  def removeBookmarkButton

    if device_is_android? # case android

      wait { find_element(:id, 'com.thetrustedinsight.tiapp:id/op_bookmark') }

    else # case ios

      wait { find_element(:name, 'iconNavBookmarkFull') }

    end


  end

  def topNavigationBar; end
end
