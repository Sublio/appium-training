require 'rubygems'

class CELL_IDENTIFIER

  attr_reader :driver

  cellTypes = Hash.new(:jobs => "jobs", :news=> "news", :events => 'events', :syndicate=> "syndicate", :profile => "profile", :ranking => "ranking",
                       :search_hires => "search_hires", :firms =>"firms")

  def initialize(driver)
    @driver = driver
    Appium.promote_appium_methods self.class
  end

  def self.identifyCell(cell)




  end
end