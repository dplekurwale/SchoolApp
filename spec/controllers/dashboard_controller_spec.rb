require 'spec_helper'

RSpec.describe DashboardController, type: :controller do
  describe 'GET show' do
    let(:admin_user) { create(:admin_user) }
    let(:school) { create(:school, created_by_admin_user_id: admin_user.id) }
    let(:student) { create(:student, school_id: school.id) }

    before do
      admin_user.add_role :admin
      student
    end

    it 'returns a successful response' do
      allow(@controller).to receive(:current_user).and_return(student)
      get :show
      expect(response).to be_successful
    end
  end
end