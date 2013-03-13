# == Schema Information
#
# Table name: priorities
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  level      :integer
#  user_id    :integer
#  color      :string(255)      default("#FFFFFF")
#

class Priority < ActiveRecord::Base
  attr_accessible :title, :description, :color, :due_date, :is_complete, :level, :user_id
  validates :title, :presence => true
  has_many :tasks, :inverse_of => :priority
  belongs_to :user, :inverse_of => :priorities

  def swap_higher
    current_priority_index = list.index{ |x| x.id == params['id'].to_i }

    if current_priority_index == 0
      priority = Priority.find(params['id'])
      priority.level += 1
      priority.save
    else
      new_level = list[(current_priority_index-1)].level # PULLS THE LEVEL FROM THE PREVIOUS ONE IN THE ARRAY, WHICH HAS A HIGHER LEVEL
      priority = Priority.find(params['id'])
      priority.level = new_level + 1
      priority.save
    end
  end
end
