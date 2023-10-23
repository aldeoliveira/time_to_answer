class UserStatistics < ApplicationRecord
  belongs_to :user

  # Virtual attributes
  def total_answers
    self.right_answers + self.wrong_answers
  end
end
