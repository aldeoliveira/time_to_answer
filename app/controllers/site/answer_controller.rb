class Site::AnswerController < SiteController
  def evaluate
    @answer = Answer.find(params[:answer_id])
    set_user_statistics(@answer)   
  end

  private

    def set_user_statistics(answer)
      if user_signed_in?
        user_statistics = UserStatistics.find_or_create_by!(user: current_user)
        (answer.correct?) ? (user_statistics.right_answers += 1) : (user_statistics.wrong_answers += 1)
        user_statistics.save
      end
    end
end
