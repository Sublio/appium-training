
class MESSAGE_PAGE

  attr_accessor :driver

  def initialize(driver)
    @driver = driver
    Appium.promote_appium_methods self.class
  end

  def findMyContactsButton

    if device_is_android?

      find_element(:xpath, '//android.widget.TextView[@content-desc="Search"]')

    else

      find_element(:id, 'FIND MY CONTACTS')
    end
  end

  def topRightButton
    if device_is_android?

      find_element(:xpath, '//android.widget.TextView[@content-desc="Search"]')

    else

      find_element(:id, 'iconTopMore')
    end

  end

  def contactsTypeSegmentControl
    if device_is_android?

      find_element(:xpath, '//android.widget.TextView[@content-desc="Search"]')

    else

      find_element(:class_name, 'XCUIElementTypeSegmentedControl')
    end

  end


  def yourNetworkSegment
    if device_is_android?

      find_element(:xpath, '//android.widget.TextView[@content-desc="Search"]')

    else

      find_element(:class_name, 'XCUIElementTypeSegmentedControl').find_elements(:class_name, 'XCUIElementTypeButton').first
    end

  end


  def allContactsSegment
    if device_is_android?

      find_element(:xpath, '//android.widget.TextView[@content-desc="Search"]')

    else

      find_element(:class_name, 'XCUIElementTypeSegmentedControl').find_elements(:class_name, 'XCUIElementTypeButton').last
    end

  end


  def searchBar

    if device_is_android?

      find_element(:xpath, '//android.widget.TextView[@content-desc="Search"]')

    else

      find_element(:name, 'Search') #search bar always in first cell
    end
  end

  def consiergeCell
    if device_is_android?

      find_element(:xpath, '//android.widget.TextView[@content-desc="Search"]')

    else

      find_element(:name, 'TI Concierge') #first cell is a search field
    end

  end

  def pullToRefresh
    if device_is_android?

      find_element(:xpath, '//android.widget.TextView[@content-desc="Search"]')

    else

      table = find_element(:class_name, 'XCUIElementTypeTable')
      swipe direction: 'down', element: table
    end

  end


  def cellFromTableByIndex(index)
    if device_is_android?

      find_element(:xpath, '//android.widget.TextView[@content-desc="Search"]')

    else

      find_element(:class_name, 'XCUIElementTypeTable').find_elements(:class_name, 'XCUIElementTypeCell')[index + 2]
    end

  end

end