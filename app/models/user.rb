class User < ApplicationRecord
  has_many :interested
  has_many :pets, through: :interested 
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :omniauthable, :omniauth_providers => [:google_oauth2]
   
  validates_uniqueness_of :email, :case_sensitive => false
  validates_presence_of :email, :on=>:create
  validates_format_of :email, :with  => Devise.email_regexp
  validates_presence_of :password, :on=>:create
  validates_confirmation_of :password, :on=>:create
  validates_length_of :password, :within => Devise.password_length 
  enum role: [:Admin, :Normal]

  scope :pets_interested, -> {joins(:interested).group('users.name')}
  scope :interested_cats, -> {joins(:interested).where('pets.species = cat').group('users.name')}
  scope :interested_dogs, -> {joins(:interested).where('pets.species = dog').group('users.name')}

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first
  
    unless user
      password = Devise.friendly_token[0,20]
      user = User.create(name: data["name"], email: data["email"],
        password: password, password_confirmation: password
      )
    end
    user
  end


end
