require 'httparty'

class StackOverflow
  include HTTParty
  @@API_KEY = nil
  
  def self.API_KEY=(value)
    @@API_KEY = value
  end

  def self.get_flair(user_id)
    get("http://stackoverflow.com/users/flair/#{user_id}.json?key=#{@@API_KEY}")
  end
  
end