module API
  module StackOverflow
    class Answer
      attr_accessor :id, :accepted, :comments_url, :question_id, :title
      attr_accessor :creation_date, :last_activity_date
      attr_accessor :up_vote_count, :down_vote_count, :view_count, :score, :community_owned

      def initialize(so_answer)
        @id = so_answer["answer_id"]
        @title = so_answer["title"]
        @accepted = so_answer["accepted"]
        @comments_url = so_answer["answer_comments_url"]
        @question_id = so_answer["question_id"]
        @creation_date = Time.at(so_answer["creation_date"]) if so_answer["creation_date"]
        @last_activity_date = Time.at(so_answer["last_activity_date"]) if so_answer["last_activity_date"]
        @up_vote_count = so_answer["up_vote_count"]
        @down_vote_count = so_answer["down_vote_count"]
        @view_count = so_answer["view_count"]
        @score = so_answer["score"]
        @community_owned = so_answer["community_owned"]
      end

      def vote_count
        @up_vote_count - @down_vote_count
      end

    end
  end
end