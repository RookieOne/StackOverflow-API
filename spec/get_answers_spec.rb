require 'spec_helper'

describe "get users answers" do
  context "363881" do
    before(:each) do
      @answers = API::StackOverflow.get_user_answers(363881)
    end
    it { @answers.should_not be_nil }
    it { @answers.count.should > 0 }
  end
end