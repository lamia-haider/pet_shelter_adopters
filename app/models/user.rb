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
  enum role: ["admin", "user"]

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

  def joindate
    self.created_at.strftime("%B %d, %Y")
  end


end
