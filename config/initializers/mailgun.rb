ActionMailer::Base.smtp_settings = {
  port:              587, 
  address:           'smtp.mailgun.org',
  user_name:         ENV['MAILGUN_SMTP_LOGIN'],
  password:          ENV['MAILGUN_SMTP_PASSWORD'],
  domain:            'app854d29119bd34f2d9c4622564a5e88ec.mailgun.org',
  authentication:    :plain,
  content_type:      'text/html',
  enable_starttls_auto: true
}
ActionMailer::Base.delivery_method = :smtp

# Makes debugging *way* easier.
ActionMailer::Base.raise_delivery_errors = true

# class DevelopmentMailInterceptor
#   def self.delivery_email(message)
#     message.to = 'edward415@gmail.com'
#     message.cc = nil
#     message.bcc = nil
#   end
# end

# if Rails.env.development?
#   ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor)
# end