module UsersHelper
  def format_status(batch, user_id)
    student_batch = batch.student_batches.find_by(batch_id: batch.id, user_id: user_id)
    student_batch&.status
  end
end
