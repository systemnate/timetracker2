class UserNotifier < ApplicationMailer
  helper :task_details
  default from: 'noreply@taskclash.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    mail( to: @user.email,
    subject: 'Thanks for signing up for our amazing app' )
  end

  def send_status_update(task, current_account)
    @task = task
    @task_details = task.task_details
    if !task.notify_email.blank?
      emails_to_send = task.notify_email.split(',')
      render :layout => false
      @current_account = current_account.subdomain
      @task = task
      @task_id = task.id
      @task_alternate_id = task.alternate_id
      @task_title = task.title
      @task_status = task.status.name
      @task_priority = task.priority.name
      @task_product = task.product.name
      @task_client = task.client.name
      @task_date = task.created_at
      @user = User.find(task.assigned_to)
      @user_name = @user.name
      @user_email = @user.email
      mail( to: emails_to_send, from: "noreply@taskclash.com", subject: "Task Clash status update on task #{task.id}")
    end
  end
end
