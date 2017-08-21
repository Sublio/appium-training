require 'rubygems'
require 'appium_lib'
require 'test/unit'
require 'require_all'
require_relative 'login_tests'
require_all 'pages'
require_all 'services'

class BookmarksiOS < Test::Unit::TestCase
  attr_reader :driver
  @@platform = if ARGV.include? 'android1'
                 'android1'
               elsif ARGV.include? 'android2'
                 'android2'
               elsif ARGV.include? 'android'
                 'android'
               else
                 'ios'
               end


  def setup

    if @@platform == 'android1'
      caps = Appium.load_appium_txt file: File.join(Dir.pwd, 'caps/appiumAndroidCaps1.txt')
    elsif @@platform == 'android2'
      caps = Appium.load_appium_txt file: File.join(Dir.pwd, 'caps/appiumAndroidCaps2.txt')
    elsif @@platform == 'android'
      caps = Appium.load_appium_txt file: File.join(Dir.pwd, 'caps/appiumAndroidCaps.txt')
    else
      caps = Appium.load_appium_txt file: File.join(Dir.pwd, 'caps/appiumiOSCaps.txt')
    end

    @driver = Appium::Driver.new(caps, global_driver = true)
    Appium.promote_appium_methods self.class
    @driver.start_driver

    LoginTestsIos.new(@driver).loginWithMail
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
  end
  def testDeleteBookmark
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
  def checkBookmarkHasAdded
    bottomBar = BOTTOM_NAV_BAR.new(@driver)
    bottomBar.bookmarksButton.click
    sleep 2
    bookmark_page = BOOKMARKS_PAGE.new(@driver)

    assert(bookmark_page.bookmarks.count > 0, 'Bookmarks table is empty!!!')
  end

end
