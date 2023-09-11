class Site::SearchController < SiteController
  def questions
    @questions = Question.includes(:answers)
                         .where("LOWER(description) LIKE ?", "%#{params[:term].downcase}%")
                         .page(params[:page])
  end
end
