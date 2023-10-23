class UserStatistics < ApplicationRecord
  belongs_to :user

  # Virtual attributes
  def total_answers
    self.right_answers + self.wrong_answers
  end

  # Class method
  def self.set_statistics(answer, current_user)
    if !!current_user
      user_statistics = UserStatistics.find_or_create_by!(user: current_user)
      (answer.correct?) ? (user_statistics.right_answers += 1) : (user_statistics.wrong_answers += 1)
      user_statistics.save
    end
  end
end
