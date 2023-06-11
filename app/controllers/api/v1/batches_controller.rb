class Api::V1::BatchesController < Api::V1::ApiController
  before_action :authenticate_user!
  before_action :set_batch, only: [:show, :join]
  
  def index
    @batches = Batch.all
    render json: @batches
  end

  def show
    render json: @batch
  end

  def join
    student_batch = StudentBatch.new(batch_id: @batch.id, user_id: current_user.id, status: 1)
    if student_batch.save
      render json: { message: 'Join request sent please wait for school confirmation' }
    else
      render json: { error: student_batch.errors.full_messages.join(',') }
    end
  end

  private
  def set_batch
    @batch = Batch.find_by(id: params[:id])
    unless @batch
      render json: { error: 'Batch not found' }
    end
  end
end