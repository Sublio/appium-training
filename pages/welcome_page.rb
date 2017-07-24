
class WELCOME_PAGE

  attr_accessor :driver

  def initialize (driver)
    @driver = driver
  end


  def loginWithEmailButton

    if @driver.device_is_android?

      driver.find('ACCESS WITH EMAIL')

    else

      driver.find_element(:name, 'ACCESS WITH EMAIL')
    end

  end
end