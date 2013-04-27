class List < ActiveRecord::Base
  validates :name, presence: true

  has_many :todos

  def completed_count
    todos.where(completed: true).size
  end
end
