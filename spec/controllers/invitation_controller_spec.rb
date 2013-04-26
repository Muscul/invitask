require 'spec_helper'
require 'email_spec'
#require 'email_spec/cucumber'

describe InvitationsController do

  include EmailSpec::Helpers
  include EmailSpec::Matchers
  # include ActionController::UrlWriter - old rails
  include Rails.application.routes.url_helpers
  
  before (:each) do
    @invitation = FactoryGirl.create(:invitation)
  end

  it "create new invitation" do
    visit new_invitation_path
    token = Invitation.get_random_token    
    fill_in "Token",    :with => token
    fill_in "Email",    :with => "email@example.com"
    click_button 'Create Invitation'
    page.should have_content("Successfully send invitation")
  end

  it "mail sent to valid reciever" do
    email = UserMailer.invitation_instructions(@invitation)
    email.should deliver_to(@invitation.email)
  end

  it "invitation link is valid" do
    email = UserMailer.invitation_instructions(@invitation)
    email.should have_body_text(@invitation.token_url)
  end

end
