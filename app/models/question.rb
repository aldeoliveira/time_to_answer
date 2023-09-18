class Question < ApplicationRecord
  belongs_to :subject, inverse_of: :questions, counter_cache: true
  has_many :answers
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: :true

  # Kaminari
  paginates_per 5

  # Scopes
  scope :_search_term_, -> (page, term) {
    includes(:answers, :subject).where("LOWER(description) LIKE ?", "%#{term.downcase}%").page(page)
  }

  scope :_last_questions_, -> (page) {
    includes(:answers, :subject).order('created_at desc').page(page)
  }

  scope :_search_subject_, -> (page, subject_id) {
    includes(:answers, :subject).where(subject_id: subject_id).page(page)
  }
end
