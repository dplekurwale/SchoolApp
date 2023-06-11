require 'rails_helper'

RSpec.describe BatchesController, type: :controller do
  let(:admin_user) { create(:admin_user) }
  let(:school) { create(:school, created_by_admin_user_id: admin_user.id) }
  let(:student) { create(:student, school_id: school.id) }
  let(:course) { create(:course) }
  let(:batch) { create(:batch) }
  let(:student_batch) { create(:student_batch, user_id: student.id, batch_id: batch.id) }

  before do
    admin_user.add_role :admin
    student
    batch
  end

  describe 'GET show' do
    it 'returns a successful response' do
      get :show, params: { id: batch.id }
      expect(response).to be_successful
    end
  end

  describe 'GET join' do
    it 'returns a successful response' do
      allow(@controller).to receive(:current_user).and_return(student)
      get :join, params: { id: batch.id }
      expect(response).to redirect_to(dashboard_path)
    end
  end
end