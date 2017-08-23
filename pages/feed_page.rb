require 'appium_lib'
class FEED
  attr_accessor :driver

  def initialize(driver)
    @driver = driver
    Appium.promote_appium_methods self.class
  end

  def table
    if device_is_android?

      find_element(:id, 'com.thetrustedinsight.tiapp:id/recycler')
    else

      find_element(:class_name, 'XCUIElementTypeTable')

    end
  end

  def cells
    if device_is_android?

      find_element(:id, 'com.thetrustedinsight.tiapp:id/recycler').find_elements(:class_name, 'android.widget.RelativeLayout') # return only visible relative layouts
    else

      find_elements(:class_name, 'XCUIElementTypeCell')

    end
  end

  def searchButton
    if device_is_android?

      find_element(:id, 'com.thetrustedinsight.tiapp:id/op_search')
    else

      find_element(:id, 'iconNavSearch')

    end

  end

  def navBarLabel
    if device_is_android?

      find_element(:id, 'com.thetrustedinsight.tiapp:id/toolbar').find_element(:class_name, 'android.widget.ImageView')
    else

      find_elements(:id, 'imgTopLogoTxt')

    end

  end

  def topSystemBar
    if device_is_android?

      continue
    else

      find_element(:class_name, 'XCUIElementTypeStatusBar')

    end
  end
  def newInsights
    if device_is_android?

      texts('New Insights')
    else

      find_elements(:id, 'New insights')

    end
  end
  def reportButton
    if device_is_android?

      find_element(:id, 'com.thetrustedinsight.tiapp:id/report_btn')
    else

      find_element(:id, 'Report')

    end
  end

  def downVoteButton
    if device_is_android?

      find_element(:id, 'com.thetrustedinsight.tiapp:id/downvote_btn')
    else

      find_element(:id, 'Downvote')

    end
  end
  def moreButton
    if device_is_android?

      find_element(:id, 'com.thetrustedinsight.tiapp:id/more_btn')
    else

      find_element(:id, 'More')

    end
  end
  def shareButton
    if device_is_android?

      find_element(:id, 'com.thetrustedinsight.tiapp:id/share_btn')
    else

      find_element(:id, 'Share')

    end
  end
  def discussButton
    if device_is_android?

      find_element(:id, 'com.thetrustedinsight.tiapp:id/discuss_btn')
    else

      find_element(:id, 'Discuss')

    end

  end
  def bookmarkButton
    if device_is_android?

      find_element(:id, 'com.thetrustedinsight.tiapp:id/bookmark_btn')
    else

      find_element(:id, 'Bookmark')

    end
  end
  def pullToRefresh
    if device_is_android?

      table = find_element(:class_name, 'android.support.v7.widget.RecyclerView')
      leftX = table.location.x
      rightX = leftX + table.size.width
      middleX = (leftX + rightX) / 2
      upperY = table.location.y
      lowerY = upperY + table.size.height
      middleY = (upperY + lowerY) / 2

      begin
        swipe start_x: middleX, start_y: middleY - 200, end_x: middleX, end_y: lowerY - 100, duration: 400
          rescue
          puts 'There is some strange error during swiping on Android. But gesture works well'
      end

    else

      table = find_element(:class_name, 'XCUIElementTypeTable')
      swipe direction: 'down', element: table

    end
  end
  def swipeLeftOnCellByIndex(index)
    if device_is_android?

      cell = find_element(:id, 'com.thetrustedinsight.tiapp:id/recycler').find_elements(:class_name, 'android.widget.RelativeLayout')[index]
      leftX = cell.location.x
      rightX = leftX + cell.size.width
      middleX = (leftX + rightX) / 2
      upperY = cell.location.y
      lowerY = upperY + cell.size.height
      middleY = (upperY + lowerY) / 2
      swipe start_x: middleX, start_y: middleY, end_x: 100, end_y: middleY, duration: 200

    else

      cell = find_element(:class_name, 'XCUIElementTypeTable').find_elements(:xpath, 'XCUIElementTypeCell')[index]
      swipe direction: 'left', element: cell

    end
  end
  def swipeRightOnCellByIndex(index)
    if device_is_android?

      wait { find_element(:id, 'com.thetrustedinsight.tiapp:id/op_search') }

      cell = find_element(:id, 'com.thetrustedinsight.tiapp:id/recycler').find_elements(:class_name, 'android.widget.RelativeLayout')[index]
      leftX = cell.location.x
      rightX = leftX + cell.size.width
      middleX = (leftX + rightX) / 2
      upperY = cell.location.y
      lowerY = upperY + cell.size.height
      middleY = (upperY + lowerY) / 2
      swipe start_x: middleX, start_y: middleY, end_x: 550, end_y: middleY, duration: 200

    else

      cell = find_element(:class_name, 'XCUIElementTypeTable').find_elements(:xpath, 'XCUIElementTypeCell')[index]
      swipe direction: 'right', element: cell

    end
  end

  def scrollTableDown
    if device_is_android?

      table = find_element(:id, 'com.thetrustedinsight.tiapp:id/recycler')

      leftX = table.location.x
      rightX = leftX + table.size.width
      middleX = (leftX + rightX) / 2
      upperY = table.location.y
      lowerY = upperY + table.size.height
      middleY = (upperY + lowerY) / 2

      swipe start_x: middleX, start_y: middleY, end_x: middleX, end_y: 150, duration: 200


    else

      table = find_element(:class_name, 'XCUIElementTypeTable')
      swipe direction: 'up', element: table

    end
  end

end
