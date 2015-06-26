class UserNotifier < ApplicationMailer
  default from: 'noreply@taskclash.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Thanks for signing up for our amazing app' )
  end

  def send_status_update(task)
    render :layout => false  
    @assigned_to = task.assigned_to
    @user = User.find(@assigned_to)
    @user_email = @user.email
    @email = task.notify_email
    mail( to: @email, from: @user_email, subject: "Task Clash status update on task #{task.id}")
  end
end
