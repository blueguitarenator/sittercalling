class BabysitMailer < ActionMailer::Base
  #http://www.practicalecommerce.com/blogs/post/442-Sending-Text-Messages-With-Ruby-on-Rails
  #http://lukeredpath.co.uk/blog/sending-sms-messages-from-your-rails-application.html
  
  default_url_options[:host] = "SitterCalling.com"  
  
  def invite(from_user, to_email)
    subject    'Sitter Invitation'
    recipients to_email
    from       'no-reply@sittercalling.com'
    sent_on    Time.now
    
    body       :user => from_user
  end

  def event(event, reply)
    subject    'Sitter Event for ' + event.user.last_name
    recipients reply.user.email
    from       'no-reply@sittercalling.com'
    sent_on    Time.now
    
    body       :event => event, :reply => reply
  end

  def reply(event, reply)
    subject    'Sitter Reply from ' + reply.user.last_name
    recipients event.user.email
    from       'no-reply@sittercalling.com'
    sent_on    Time.now
    
    body       :event => event, :reply => reply
  end

  def reset_password_instructions(user)
    subject    'Password Reset'
    recipients user.email
    from       'no-reply@sittercalling.com'
    sent_on    Time.now
    
    body       :reset_password_url => reset_password_url(user.perishable_token)  
  end

end
