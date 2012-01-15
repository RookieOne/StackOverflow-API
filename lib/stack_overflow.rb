require 'httparty'
require 'json'
require 'question'
require 'answer'

module API
  module StackOverflow
    include HTTParty
    @@API_KEY = nil
    @@URL = "http://api.stackoverflow.com/1.1/"

    def self.API_KEY=(value)
      @@API_KEY = value
    end

    def self.get_all_users(options={})
      key = @@API_KEY
      page = options[:page] || 1
      pagesize = options[:pagesize] || 30
      url = URI.parse(@@URL + "users?key=#{key}&page=#{page}&pagesize=#{pagesize}")
      response = Net::HTTP.get_response url
      gz = Zlib::GzipReader.new(StringIO.new(response.body))
      JSON.parse(gz.read)
    end

    def self.get_user(user_id)
      result = get(@@URL + "users/#{user_id}?key=#{@@API_KEY}")
      return nil if result["users"].nil?
      result["users"].first
    end

    def self.get_users(user_ids)
      user_id = user_ids.join(";").to_s
      result = get(@@URL + "users/#{user_id}?key=#{@@API_KEY}")
      result["users"]
    end

    def self.get_user_questions(user_id)
      result = get(@@URL + "users/#{user_id}/questions?key=#{@@API_KEY}")
      result["questions"].map{|q| Question.new(q) }
    end

    def self.get_user_answers(user_id)
      result = get(@@URL + "users/#{user_id}/answers?key=#{@@API_KEY}")
      result["answers"].map{|a| Answer.new(a) }
    end

    def self.get_user_tags(user_id)
      get(@@URL + "users/#{user_id}/tags?key=#{@@API_KEY}")
    end

    def self.get_tags
      get(@@URL + "tags?key=#{@@API_KEY}")
    end

    def self.get_tags_synonyms
      get(@@URL + "tags/synonyms?key=#{@@API_KEY}")
    end

  end
end
