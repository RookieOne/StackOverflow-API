require 'spec_helper'

describe StackOverflow do
  before(:each) do
    StackOverflow.API_KEY = ENV["SO_API_KEY"]
  end
  
  describe "get flair" do
    before(:each) do
      @flair = StackOverflow.get_flair(60336)
    end
    it { @flair.should_not be_nil }
    it { @flair["displayName"].should == "JB"}
  end
  
end