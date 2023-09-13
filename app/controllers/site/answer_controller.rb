class Site::AnswerController < SiteController
  def evaluate
    puts ">>>>>>>>>>>> #{params[:answer]}"
  end
end
