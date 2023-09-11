class Site::SearchController < SiteController
  def questions
    @questions = Question.search_term(params[:page], params[:term])
  end
end
