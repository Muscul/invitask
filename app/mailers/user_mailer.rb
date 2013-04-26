class UserMailer < Devise::Mailer
  default :from => Devise.mailer_sender
  def invitation_instructions(invitation)
    @invitation = invitation
    mail(:to => invitation.email, :subject => configatron.emails.invitation.subject)
  end
end
