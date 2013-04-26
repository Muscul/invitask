# Override your default settings for the Production environment here.
# 
# Example:
#   configatron.file.storage = :s3

configatron.host = "invitask-serogo.herokuapp.com"

configatron.emails.default_url_options.host = "invitask-serogo.herokuapp.com"

configatron.emails.smtp_settings = {
  :address   => "smtp.mandrillapp.com",
  :port      => 587, # ports 587 and 2525 are also supported with STARTTLS
  :enable_starttls_auto => true, # detects and uses STARTTLS
  :user_name => "sergey.sntu+test@gmail.com",
  :password  => "aiyoGrlR9HQ5N-byMMDZBw", # SMTP password is any valid API key
  :authentication => 'login' # Mandrill supports 'plain' or 'login'
}
