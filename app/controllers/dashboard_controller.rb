class DashboardController < ApplicationController

  def show
    @school = current_user.school
    @batches = @school.batches
  end

end
