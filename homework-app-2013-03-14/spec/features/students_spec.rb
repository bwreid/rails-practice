require 'spec_helper'

describe 'Students Controller' do

  describe 'GET /students', :js => true do
    it 'should have a drop down ajax form that shows up on click' do
      visit students_path
      page.should have_link('New Student')
      click_link('New Student')
      page.should have_button('Create Student')
    end
  end

  describe 'POST /students', :js => true do
    it 'should remove the form on create and add a new student, with the students name capitalized' do
      visit students_path
      page.should have_link('New Student')
      click_link('New Student')

      fill_in 'student_name', with: 'alex'
      click_button('Create Student')

      page.should_not have_button('Create Student')
      page.should have_text('Alex')
      expect(Student.first.name).to eq('Alex')
    end
  end

end