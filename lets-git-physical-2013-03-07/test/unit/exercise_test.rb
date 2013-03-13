# == Schema Information
#
# Table name: exercises
#
#  id             :integer          not null, primary key
#  activity       :string(255)
#  value          :integer
#  unit           :string(255)
#  when_completed :date
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class ExerciseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
