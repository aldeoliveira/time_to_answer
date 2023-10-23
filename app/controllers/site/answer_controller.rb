class Site::AnswerController < SiteController
  def evaluate
    @answer = Answer.find(params[:answer_id])
    UserStatistics.set_statistics(@answer, current_user) 
  end   
end
