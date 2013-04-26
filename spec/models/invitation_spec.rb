require 'spec_helper'

describe Invitation do

  it "invitation should require an email address" do
    no_email_invitation = Invitation.new({token: Invitation.get_random_token})
    no_email_invitation.errors_on(:email).should_not be_nil
  end

  it "should reject duplicate token" do
    same_token = Invitation.get_random_token
    Invitation.create({token: same_token, email: "sergey.sntu@gmail.com"})
    invitation = Invitation.new({token: same_token, email: "sergey.sntu+test2@gmail.com"})
    invitation.errors_on(:token).should_not be_nil
  end

end
