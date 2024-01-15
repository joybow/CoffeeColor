class Task < ApplicationRecord
  belongs_to :user

  def start_time
    self.start_time
  end

  def end_time
    self.end_time
  end

end
