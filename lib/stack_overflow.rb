require 'httparty'

class StackOverflow
  include HTTParty
  @@API_KEY = nil
  
  def self.API_KEY=(value)
    @@API_KEY = value
  end

  def self.get_user(user_id)
    result = get("http://api.stackoverflow.com/1.0/users/#{user_id}?key=#{@@API_KEY}")
    result["users"].first
  end
  
  def self.get_users(user_ids)
    user_id = user_ids.join(";").to_s
    result = get("http://api.stackoverflow.com/1.0/users/#{user_id}?key=#{@@API_KEY}")
    result["users"]  
  end
end