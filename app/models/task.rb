class Task < ApplicationRecord
  belongs_to :user
  
  def start_time
    self.my_related_model.start
  end

  def end_time
    self.end_time
  end

end
