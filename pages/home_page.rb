#user feed page


class HOME

  attr_accessor :driver

  def initialize (driver)
    @driver = driver
  end

  def searchButton
    if @driver.device_is_android?

      driver.find_element(:id, 'com.thetrustedinsight.tiapp:id/op_search')

    else

      @driver.find_element(:name, 'iconNavSearch')

    end
  end

end