class UserMailer < Devise::Mailer
  def invitation_instructions(invitation)
    @invitation = invitation
    mail(:to => invitation.email, :subject => configatron.emails.invitation.subject)
  end
end
