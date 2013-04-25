class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :registerable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :phone, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  validates_presence_of :name
  validates_formatting_of :email, :using => :email  
  validates_format_of :phone, 
    :allow_blank => true,
    :message => "must be a valid telephone number.",
    :with => /^[\(\)0-9\- \+\.]{10,20} *[extension\.]{0,9} *[0-9]{0,5}$/i 


end
