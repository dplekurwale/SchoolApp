class BatchesController < ApplicationController
  before_action :set_batch

  def show
  end

  def join
    student_batch = StudentBatch.new(batch_id: @batch.id, user_id: current_user.id, status: 1)
    if student_batch.save
      flash[:notice] = 'Join request sent please wait for school confirmation'
    else
      flash[:alert] = 'Something went wrong. Try again later'
    end
    redirect_to dashboard_path
  end

  private
  def set_batch
    @batch = Batch.find(params[:id])
  end

end
