require 'spec_helper'

describe 'Students Controller' do

  describe 'GET /students' do
    it 'should have a drop down ajax form that shows up on click' do
      visit.assignments_path
      page.should have_link('New Student')
      click_link('New Student')
      page.should have_button('Create Student')
      click_link('Cancel')
      page.should_not have_button('Create Student')
    end
  end

  describe 'POST /students' do
    it 'should remove the form on create and add a new student' do
      visit.assignments_path
      page.should have_link('New Student')
      click_link('New Student')
      fill_in('name', with: 'alex')
      click_button('Create Student')
      page.should_not have_button('Create Student')
      page.should have_text('Alex')
      expect(Student.first.name).to eq('Alex')
    end
  end

end