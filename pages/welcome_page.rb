
class WELCOME_PAGE
  attr_accessor :driver

  def initialize(driver)
    @driver = driver
    Appium.promote_appium_methods self.class
  end

  def loginWithEmailButton
    if device_is_android?

      text('ACCESS WITH EMAIL')

    else

      find_element(:name, 'ACCESS WITH EMAIL')
    end
  end
end
