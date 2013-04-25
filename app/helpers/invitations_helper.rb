module InvitationsHelper

  def invitation_url(inviation)
    "#{request.fullpath}"
  end
end
