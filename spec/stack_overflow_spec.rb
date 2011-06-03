require 'spec_helper'

describe StackOverflow do
  before(:each) do
    StackOverflow.API_KEY = ENV["SO_API_KEY"]
  end

  describe "get all users" do
    context "all users" do 
      before(:each) do
        @result = StackOverflow.get_all_users
      end
      it { @result.should_not be_nil }
    end

    context "second page" do
      before(:each) do
        @result = StackOverflow.get_all_users(:page => 2)
      end
      it { @result.should_not be_nil }
    end

    context "50 per page" do
      before(:each) do
        @result = StackOverflow.get_all_users(:pagesize => 50)
      end
      it { @result["users"].count.should == 50 }
    end
  end
  
  describe "get user" do
    before(:each) do
      @user = StackOverflow.get_user(60336)
    end
    it { @user.should_not be_nil }
    it { @user["display_name"].should == "JB"}
  end
  
  describe "get users" do
    before(:each) do
      @users = StackOverflow.get_users([60336, 3381])
    end
    it { @users.should_not be_nil }
    it { @users.select{|u| u["display_name"] == "JB"}.should_not be_nil }
    it { @users.select{|u| u["display_name"] == "Ben Scheirman"}.should_not be_nil }
  end
  
  describe "get user tags" do
    before(:each) do
      @tags = StackOverflow.get_user_tags(60336)
    end
    it { @tags.should_not be_nil }
    it { @tags["tags"].count.should > 0 }
  end

  describe "get tags" do
    before(:each) do
      @tags = StackOverflow.get_tags
    end
    it { @tags.should_not be_nil }
    it { @tags["tags"].count.should > 0 }
  end

  describe "get tags synonyms" do
    before(:each) do
      @tags_synonyms = StackOverflow.get_tags_synonyms
    end
    it { @tags_synonyms.should_not be_nil }
    it { @tags_synonyms["tag_synonyms"].count.should > 0 }
  end

  describe "get users answers" do
    before(:each) do
      @answers = StackOverflow.get_user_answers(363881)
    end
    it { @answers.should_not be_nil }
    it { @answers.count.should > 0 }
  end

  describe "get users questions" do
    before(:each) do
      @questions = StackOverflow.get_user_questions(363881)
    end
    it { @questions.should_not be_nil }
    it { @questions.count.should > 0 }
  end

end
