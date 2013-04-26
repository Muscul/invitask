# Override your default settings for the Development environment here.
# 
# Example:
#   configatron.file.storage = :local

configatron.host = "localhost:3000"

configatron.emails.default_url_options.host = "localhost:3000"

configatron.emails.smtp_settings = {
  :address   => "smtp.mandrillapp.com",
  :port      => 587, # ports 587 and 2525 are also supported with STARTTLS
  :enable_starttls_auto => true, # detects and uses STARTTLS
  :user_name => "sergey.sntu+test@gmail.com",
  :password  => "aiyoGrlR9HQ5N-byMMDZBw", # SMTP password is any valid API key
  :authentication => 'login' # Mandrill supports 'plain' or 'login'
}