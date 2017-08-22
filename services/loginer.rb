require_relative '../../appium-training/user_data_depot'

class Loginer

  def loginWithMailPassUsingDriver(mail, password, driver)

    driver.device_is_android? ? (platform = 'android') : (platform = 'ios')

    if platform == 'android'
      #begin login android driver

      driver.text('ACCESS WITH EMAIL').click
      driver.textfields.first.type(mail)
      driver.find_element(:id, 'com.thetrustedinsight.tiapp:id/join_ab_next').click
      sleep(2)
      driver.textfields.first.type(password)
      driver.find_element(:id, 'com.thetrustedinsight.tiapp:id/join_ab_next').click
      sleep(5)
    else
      #begin logining ios driver
      driver.find_element(:name, 'ACCESS WITH EMAIL').click
      driver.find_element(:class_name, 'XCUIElementTypeTextField').type(mail)
      driver.find_element(:name, 'NEXT').click
      sleep 2
      driver.find_element(:class_name, 'XCUIElementTypeSecureTextField').type(password)
      driver.find_element(:name, 'LOG IN').click
      sleep 10

      buttons = driver.find_elements(:class_name, 'XCUIElementTypeButton')

      if buttons[0].label == 'ENABLE NOTIFICATIONS'

        buttons[0].click
        sleep 2
        driver.find_elements(:class_name, 'XCUIElementTypeButton')[1].click # OK button on permission alert

      end
    end
  end
end