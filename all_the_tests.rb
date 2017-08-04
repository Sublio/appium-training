# all  tests

require 'test/unit'
require_relative 'login_tests.rb'
require_relative 'bookmarks_tests'
require_relative 'feed_tests'

# TODO: Swipe on cell with scrollView inside. Working with menu under the cell.(Bookmarks, downvote...).

#out = %x`xcrun instruments -s devices` -save system calls into variable