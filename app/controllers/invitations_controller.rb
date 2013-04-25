class InvitationsController < ApplicationController
  def index
    @invitations = Invitation.all
  end

  def show
    @invitation = Invitation.find(params[:id])
  end

  def new
    @invitation = Invitation.new
    @invitation.token = Devise.friendly_token[0,20]
  end

  def create
    @invitation = Invitation.new(params[:invitation])
    if @invitation.save
      redirect_to @invitation, :notice => "Successfully send invitation."
    else
      render :action => 'new'
    end
  end

  def edit
    @invitation = Invitation.find(params[:id])
  end

  def update
    @invitation = Invitation.find(params[:id])
    if @invitation.update_attributes(params[:invitation])
      redirect_to @invitation, :notice  => "Successfully resend invitation."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @invitation = Invitation.find(params[:id])
    @invitation.destroy
    redirect_to invitations_url, :notice => "Successfully destroyed invitation."
  end

  def resend
    invitation = Invitation.find(params[:id])
    invitation.send_invitations
    redirect_to invitations_url, :notice => "Successfully resend invitation to #{invitation.email}."
  end

end
