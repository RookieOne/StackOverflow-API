require 'spec_helper'

describe "get users questions" do
  context "363881" do
    before(:each) do
      @questions = API::StackOverflow.get_user_questions(363881)
    end
    it { @questions.should_not be_nil }
    it { @questions.count.should > 0 }
  end
end