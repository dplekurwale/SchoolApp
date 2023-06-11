require 'rails_helper'

RSpec.describe 'Dashboard page', type: :feature do
  let(:admin_user) { create(:admin_user) }
  let(:school) { create(:school, created_by_admin_user_id: admin_user.id) }
  let(:student) { create(:student, school_id: school.id) }
  let(:course) { create(:course, school_id: school.id) }
  let(:batch1) { create(:batch, course_id: course.id, school_id: school.id) }
  let(:batch2) { create(:batch, course_id: course.id, school_id: school.id) }
 
  before do
    batch1
    batch2
    sign_in student
  end

  scenario 'render student batches details' do
    expect(page).to have_content('Welcome to School')
    find(".link.#{batch1.name} > a").click
    expect(page).to have_content('Join request sent please wait for school confirmation')
    expect(page).to have_content('requested')
    StudentBatch.last.update_column(:status, 2)
    visit dashboard_path
    expect(page).to have_content('approved')
    click_link "#{batch1.name}"
    expect(page).to have_content('Students:')
    click_link 'Back to Dashboard'
    expect(page).to have_content('Welcome to School')
    expect(page).to have_content('Dashboard')
  end
end
