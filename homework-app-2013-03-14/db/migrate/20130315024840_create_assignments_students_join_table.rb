class CreateAssignmentsStudentsJoinTable < ActiveRecord::Migration
  def change
    create_table :assignments_students do |j|
      j.integer :assignment_id
      j.integer :student_id
    end
  end
end
