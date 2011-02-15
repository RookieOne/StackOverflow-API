require 'httparty'

class StackOverflow
  include HTTParty
  @@API_KEY = nil
  @@URL = "http://api.stackoverflow.com/1.1/"

  def self.API_KEY=(value)
    @@API_KEY = value
  end

  def self.get_user(user_id)
    result = get(@@URL + "users/#{user_id}?key=#{@@API_KEY}")
    result["users"].first
  end
  
  def self.get_users(user_ids)
    user_id = user_ids.join(";").to_s
    result = get(@@URL + "users/#{user_id}?key=#{@@API_KEY}")
    result["users"]  
  end
  
  def self.get_user_tags(user_id)
    get(@@URL + "users/#{user_id}/tags?key=#{@@API_KEY}")
  end

  def self.get_tags
    get(@@URL + "tags?key=#{@@API_KEY}")
  end

end
