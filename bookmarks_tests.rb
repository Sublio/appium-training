require 'rubygems'
require 'appium_lib'
require 'test/unit'
require 'require_all'
require_relative 'login_tests'
require_all 'pages'
require_all 'services'

class BookmarksiOS < Test::Unit::TestCase
  attr_reader :driver

  @@platform = if ARGV.include? 'android'

                 'android'
               else
                 'ios'
               end

  def setup
    puts 'bookmarks test'
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
    @driver_quit
  end

  def testAddBookmarkFromInsideCell
    homepage = HOME.new(@driver)
    cell = homepage.cellFromFeedTableByIndex(1)
    cell.click
    cellContentPage = CELLCONTENT_PAGE.new(@driver)
    cellContentPage.addToBookmarkButton.click
    cellContentPage.backButton.click

    sleep 2

    checkBookmarkHasAdded
  end  def testDeleteBookmark
    bottombar = BOTTOM_NAV_BAR.new(@driver)

    wait { bottombar.bookmarksButton.displayed? }
    bottombar.bookmarksButton.click
    bookmarksPage = BOOKMARKS_PAGE.new(@driver)
    wait { bookmarksPage.table.displayed? }

    if bookmarksPage.bookmarks.count > 0

      bookmarksPage.bookmarks.first.click

        content = CELLCONTENT_PAGE.new(@driver)
        content.removeBookmarkButton.click
        content.backButton.click
        sleep 1
    end

    wait { bookmarksPage.noBookmarksLabel.displayed? }
  end

 # def testBookmarkFilter: end

  private

  def loginWithMail(mail = 'sublio@rambler.ru', pass = 'avatar1260')
    welcomePage = WELCOME_PAGE.new(@driver)
    welcomePage.loginWithEmailButton.click
    loginPage = ENTER_EMAIL_PAGE.new(@driver)
    loginPage.emailField.type mail
    wait { loginPage.nextButton }
    loginPage.nextButton.click
    passwordPage = ENTER_PASS_PAGE.new(@driver)

    sleep 2

    passwordPage.passField.type pass

    wait { passwordPage.nextButton }

    passwordPage.nextButton.click

    homePage = HOME.new(@driver)

    wait { homePage.searchButton.displayed? }

    homePage.enableNotificationsIfNeeded
  end
  def checkBookmarkHasAdded
    bottomBar = BOTTOM_NAV_BAR.new(@driver)
    bottomBar.bookmarksButton.click
    sleep 2
    bookmark_page = BOOKMARKS_PAGE.new(@driver)

    assert(bookmark_page.bookmarks.count > 0, 'Bookmarks table is empty!!!')
  end
end
