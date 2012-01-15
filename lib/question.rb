module API
  module StackOverflow
    class Question
      attr_accessor :answer_count, :accepted_answer_id, :favorite_count, :timeline_url
      attr_accessor :comments_url, :answers_url, :id
      attr_accessor :creation_date, :last_edit_date, :last_activity_date
      attr_accessor :up_vote_count, :down_vote_count, :view_count, :score
      attr_accessor :community_owned, :title

      def initialize(so_question)
        @id = so_question["question_id"]
        @answer_count = so_question["answer_count"]
        @accepted_answer_id = so_question["accepted_answer_id"]
        @favorite_count = so_question["favorite_count"]
        @timeline_url = so_question["question_timeline_url"]
        @comments_url = so_question["question_comments_url"]
        @answers_url = so_question["question_answers_url"]
        @creation_date = Time.at(so_question["creation_date"]) if so_question["creation_date"]
        @last_edit_date = Time.at(so_question["last_edit_date"]) if so_question["last_edit_date"]
        @last_activity_date = Time.at(so_question["last_activity_date"]) if so_question["last_activity_date"]
        @up_vote_count = so_question["up_vote_count"]
        @down_vote_count = so_question["down_vote_count"]
        @view_count = so_question["view_count"]
        @score = so_question["score"]
        @community_owned = so_question["community_owned"]
        @title = so_question["title"]
      end

      def vote_count
        @up_vote_count - @down_vote_count
      end

    end
  end
end