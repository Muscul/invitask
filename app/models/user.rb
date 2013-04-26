class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :registerable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :phone, :email, :password, :password_confirmation, :remember_me, :token
  attr_accessor :token

  validate :token, :validate_token
  validates_presence_of :name
  validates_formatting_of :email, :using => :email  
  validates_format_of :phone, 
    :allow_blank => true,
    :message => "must be a valid telephone number.",
    :with => /^[\(\)0-9\- \+\.]{10,20} *[extension\.]{0,9} *[0-9]{0,5}$/i 

  after_create do 
    invitation = Invitation.where(:token => self.token).first
    if invitation
      invitation.accepted = true
      invitation.save
    end
  end

  protected

  def validate_token
    if self.new_record? && self.token != nil # allow create accout with no token
      if self.token == ""
        self.errors.add(:base, "Invitation is required")
      else
        invitation = Invitation.where(:token => self.token).first
        if invitation == nil
          self.errors.add(:base, "Invitation token is invalid")
        elsif invitation.accepted
          self.errors.add(:base, "Invitation token already accepted")
        end
      end
    end
  end


end
