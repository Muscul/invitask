class Invitation < ActiveRecord::Base
  attr_accessible :token, :email, :accepted

  validates_formatting_of :email, :using => :email
  validates_uniqueness_of :email, :token
  validates_presence_of :email, :token

  after_save do 
    if self.new_record? || self.token_changed? || self.email_changed?
      self.send_invitations
    end    
  end

  def token_url
    "http://#{configatron.host}/invitation/#{self.token}"
  end

  def send_invitations
    UserMailer.invitation_instructions(self).deliver
  end

end
