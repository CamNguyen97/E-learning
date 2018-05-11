class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   enum role: {user: false, admin: true}, _suffix: true
   enum sex: {male: false, female: true}, _suffix: true
   has_many :categoriesCourses
   validates :email, presence: true, uniqueness: true

	# def after_sign_in_path_for(resource)
	# 	byebug
	#   if current_user.role?
	#     rails_admin.dashboard_path
	#   else
	#     user_path(current_user)
	#   end
	# end

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
