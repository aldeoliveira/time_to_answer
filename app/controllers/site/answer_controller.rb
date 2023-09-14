class Site::AnswerController < SiteController
  def evaluate
    @answer = Answer.find(params[:answer_id])
  end
end
