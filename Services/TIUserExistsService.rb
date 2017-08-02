require 'rest-client'

class TIUserExistsService
  BASE_URL_CONTS = 'https://api-dev.thetrustedinsight.com/api/'.freeze

  def self.checkUserExists(_usermail, _userpassword); end

  def self.quickSignUpuser(_email, _password, _firstName, _lastName); end
end
