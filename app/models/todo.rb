class Todo < ActiveRecord::Base
  validates :todo_text, presence: true
  validates :todo_text, length: { minimum: 2 }
  validates :due_date, presence: true

  belongs_to :user

  def def(to_pleasant_string)
    is_completed = completed ? "[x]" : "[ ]"
    "#{id}. #{due_date.to_s(:long)} #{todo_text} #{is_completed}"
  end

  def self.of_user(user)
    all.where(user_id: user.id)
  end

  def self.overdue
    all.where("due_date < ? and completed = ?", Date.today, false) #wo active record ka object pee active records ka hi function use kia j
    #all.where("due_date < ? and completed = ?", Date.today, true)
  end

  def self.due_today
    all.where("due_date = ?", Date.today)
  end

  def self.due_later
    all.where("due_date > ?", Date.today)
  end

  def self.completed
    all.where("completed = ?", true)
  end
end
