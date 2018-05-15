class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   enum role: {user: false, admin: true}, _suffix: true
   enum sex: {male: false, female: true}, _suffix: true
   has_many :categoriesCourses
   	has_many :courses, through: :categoriesCourses
   validates :email, presence: true, uniqueness: true

	# devise :database_authenticatable, :registerable,
 #    :recoverable, :rememberable, :trackable, :validatable,
 #    :omniauthable, omniauth_providers: [:google_oauth2]

 devise :omniauthable, omniauth_providers: [:google_oauth2]

   def self.new_with_session params, session
    super.tap do |user|
      if data = session["devise.facebook_data"] &&
        session["devise.facebook_data"]["extra"]["raw_info"]
        # user.name = data["name"] if user.name.blank?
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(access_token) 
  	byebug
		data = access_token.info 
		user = User.where(email: data['email']).first 
		# Uncomment the section below if you want users to be created if they don't exist 
		# unless user 
		# user = User.create(name: data['name'], # email: data['email'],
		 # password: Devise.friendly_token[0,20] # ) 
		# end 
		user 
	end

	rails_admin do
		list do
		  
		  field :name do
		    label "Name"
		  end

		  field :sex do
		    label "Sex"
		  end

		  field :email do
		    label "Email"
		  end

		  field :phone do
		    label "Phone"
		  end

		  field :address do
		    label "Address"
		  end

		  field :dateOfbirth do
		    label "Date Of Birth"
		    strftime_format "%d-%m-%Y"
		  end

		  field :role do
		    label "Role"
		  end

		end
	end
end
