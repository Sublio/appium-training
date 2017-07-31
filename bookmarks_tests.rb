require 'rubygems'
require 'appium_lib'
require 'test/unit'
require 'require_all'
require_all 'pages'
require_all 'Services'

class BookmarksiOS < Test::Unit::TestCase

  attr_reader :driver

  if ARGV.include? 'android'

    @@platform = 'android'
  else
    @@platform = 'ios'
  end

  def setup

    if @@platform == 'android'
      caps = Appium.load_appium_txt file: File.join(Dir.pwd, 'caps/appiumAndroidCaps.txt')
    else
      caps = Appium.load_appium_txt file: File.join(Dir.pwd, 'caps/appiumiOSCaps.txt')
    end

    @driver = Appium::Driver.new(caps)
    Appium.promote_appium_methods self.class
    @driver.start_driver

    loginWithMail
  end


  def teardown
    driver_quit
  end


  def testAddBookmark

    homepage = HOME.new(@driver)
    cell = homepage.cellFromFeedTableByIndex(0)

    if !(@driver.device_is_android?)
      swipe(direction: "left", element: cell)
    else

      left_x = cell.location.x
      right_x = left_x + cell.size.width
      middle_x = (left_x + right_x)/2
      upper_y = cell.location.y
      lower_y = upper_y + cell.size.height
      middle_y = (upper_y + lower_y)/2

      swipe start_x: middle_x, start_y: middle_y, end_x: 180, end_y: middle_y, duration: 1000
      sleep (5)

    end

    sleep 2

    if !(@driver.device_is_android?)

      @driver.find_element(:id, 'Bookmark').click #ios case

    else

      text("Bookmark").click #android case

    end

    checkBookmarkHasAdded

  end


  private

  def loginWithMail(mail = 'sublio@rambler.ru', pass = 'avatar1260')

    welcomePage = WELCOME_PAGE.new(@driver)
    welcomePage.loginWithEmailButton.click
    loginPage = ENTER_EMAIL_PAGE.new(@driver)
    loginPage.emailField.type mail
    sleep 2
    loginPage.nextButton.click
    passwordPage = ENTER_PASS_PAGE.new(@driver)
    sleep 2
    passwordPage.passField.type pass

    passwordPage.nextButton.click

    homePage = HOME.new(@driver)

    wait { homePage.searchButton.displayed? }

    homePage.enableNotificationsIfNeeded

  end


  def checkBookmarkHasAdded

    bottomBar = BOTTOM_NAV_BAR.new(@driver)
    bottomBar.bookmarksButton.click
    bookmark_page = BOOKMARKS_PAGE.new(@driver)

    assert(bookmark_page.bookmarks.count>0, "Bookmarks table is empty!!!")

  end

end