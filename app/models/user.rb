class User < ActiveRecord::Base

  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
       		:omniauthable, :omniauth_providers => [:facebook]

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "default_avatar_female.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    	user.provider = auth.provider
    	user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      # user.name = auth.info.name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
    end
  end

  def self.search(query)
    where("email like ?", "%#{query}%") 
  end

  def self.AllNurses
    where(is_rn: true)
	end

  def self.LookingForDifferentPerson
    where(is_self: true)
  end


end
