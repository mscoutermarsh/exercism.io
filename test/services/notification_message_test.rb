require './test/app_helper'

require 'services/message'
require 'services/notification_message'
require 'mocha/setup'

class NotificationMessageTest < MiniTest::Unit::TestCase
  include DBCleaner

  attr_reader :alice, :bob, :submission

  def setup
    super
    @alice = User.create(username: 'alice')
    @bob = User.create(username: 'bob', mastery: ['ruby'], email: 'test@exercism.io')
    @submission = Submission.create(language: 'ruby', slug: 'word-count', state: 'pending', user: alice)
  end

  def notification_message
    @notification_message ||= NotificationMessage.new(user: bob, intercept_emails: true)
  end

  def test_subject
    SubmissionNotification.on(submission, to: bob, regarding: 'dogs')
    SubmissionNotification.on(submission, to: bob, regarding: 'puppies')
    assert_equal 'You have 2 notifications', notification_message.subject
  end

  def test_gets_only_own_notifications
    SubmissionNotification.on(submission, to: alice, regarding: 'dogs')
    SubmissionNotification.on(submission, to: bob, regarding: 'dogs')
    assert_equal 'You have 1 notification', notification_message.subject
  end

  def test_doesnt_send_empty_email
    notification_message.stubs(:notifications).returns([])
    assert_equal false, notification_message.ship
  end

  def test_sends_email
    return if ENV['CI'] == '1'

    SubmissionNotification.on(submission, to: bob, regarding: 'comment')
    SubmissionNotification.on(submission, to: bob, regarding: 'nitpick', created_at: 2.hours.ago)
    Submission.create(language: 'javascript', slug: 'word-count', state: 'pending', user: alice)
    Submission.create(language: 'ruby', slug: 'leap', state: 'pending', user: alice, created_at: 1.days.ago)
    notification_message.ship

    # integration test, view in mailcatcher.
  end

end
