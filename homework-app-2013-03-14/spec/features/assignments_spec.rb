require 'spec_helper'

describe 'Assignments Controller' do

  describe 'GET /assignments', :js => true do
    it 'should have a drop down ajax form that shows up on click' do
      visit assignments_path
      page.should have_link('New Assignment')
      click_link('New Assignment')
      page.should have_button('Create Assignment')
      click_link('Cancel')
      page.should_not have_button('Create Assignment')
    end
  end

  let(:alex) { Student.create( name: 'alex') }
  let(:bryan) { Student.create( name: 'bryan') }
  let(:cindy) { Student.create( name: 'cindy') }
  describe 'POST /assignments', :js => true do
    it 'should remove the form on create and add a new assignment' do
      visit assignments_path
      page.should have_link('New Assignment')
      click_link('New Assignment')
      fill_in('assignment_name', :with => 'rockr')
      fill_in('assignment_group_size', :with => 2)
      click_button('Create Assignment')
      # page.should_not have_button('Create Assignment')
      # page.should have_text('rockr')
      # expect(Assignment.first.name).to eq('assignment')
      # expect(Assignment.first.students).to eq([alex, bryan, cindy])
    end
  end

  let(:assignment) { Assignment.create( name: 'XYZ', :group_size => 2 ) }
  describe 'GET /assignments show page', :js => true do
    it 'should have a list of some students and group names' do
      visit assignments_path
      page.should have_link('XYZ')
      click_link('XYZ')
      page.should have_text('Group 1')
      page.should have_text('Alex')
      page.should have_text('Group 2')
      page.should have_text('Cindy')
    end
  end

end