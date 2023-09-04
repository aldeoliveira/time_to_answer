class Question < ApplicationRecord
  belongs_to :subject

  paginates_per 20
end
