namespace :digest do
  desc "Sends digest email of Notifications/Submissions to user"
  task :send_emails do
    require 'bundler'
    Bundler.require
    require 'exercism'
    require 'app/presenters/workload'
    require 'services'
    require 'services/notification_message'

    # Send daily notification email to all users with notification in
    # past 24 hours
    notifications = Notification.on_submissions.unread.where('created_at >= ?', 1.days.ago)
    user_ids = notifications.select(:user_id).group(:user_id).map(&:user_id)

    user_ids.each do |user_id|
      user = User.find(user_id)
      NotificationMessage.new(user: user, intercept_emails: true).ship if user.email
    end
  end
end
