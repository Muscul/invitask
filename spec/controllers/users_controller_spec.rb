require 'spec_helper'

require 'rubygems'  

describe Users::RegistrationsController do

  before (:each) do
    @user = FactoryGirl.create(:user)
  end

  it "should be sign in" do
    sign_in @user
    subject.current_user.should_not be_nil
  end

  it "should be sign out" do
    sign_in @user
    sign_out @user
    subject.current_user.should be_nil
  end

  it "sign up with valid invite" do
    @invitation = FactoryGirl.create(:invitation)
    visit "/invitation/#{@invitation.token}"
    fill_in "token",    :with => @invitation.token
    fill_in "Name",     :with => "Example User"
    fill_in "Email",    :with => "email@example.com"
    fill_in "user[password]", with: @user.password
    fill_in "user[password_confirmation]", with: @user.password
    click_button 'Sign up'
    page.should have_content('Sign Out')
  end

  it "sign up with accepted invite" do
    @invitation = FactoryGirl.create(:invitation)
    @invitation.accepted = true
    @invitation.save
    visit "/invitation/#{@invitation.token}"
    fill_in "token",    :with => @invitation.token
    fill_in "Name",     :with => "Example User"
    fill_in "Email",    :with => "email+1@example.com"
    fill_in "user[password]", :with => @user.password
    fill_in "user[password_confirmation]", :with => @user.password
    click_button 'Sign up'
    page.should have_content('Invitation token already accepted')
  end

  it "suggest for input phone" do
    visit new_user_session_path
    fill_in 'Email', :with => @user.email
    fill_in 'Password', :with => @user.password
    click_button "Sign in"
    page.should have_content('What about your phone?')
  end

  it "set phone for hide suggestion message" do
    # auth
    visit new_user_session_path
    fill_in 'Email', :with => @user.email
    fill_in 'Password', :with => @user.password
    click_button "Sign in"
    # edit profile
    visit edit_user_registration_path
    fill_in 'Phone', :with => "+380664682494"
    fill_in "user[current_password]", :with => @user.password
    click_button "Update"
    page.should_not have_content('What about your phone?')
  end

end
