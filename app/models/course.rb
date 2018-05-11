class Course < ApplicationRecord
	validates :name, presence: true, uniqueness: true
	validates :dateDay, presence: true, uniqueness: true
	has_many :categoriesCourses

	rails_admin do
		label "Course"

		list do
	      field :name do
	        label "Name"
	      end

	      field :dateDay do
	        label "Date"
	        strftime_format "%d-%m-%Y"
	      end
	    end

	    edit do
	      field :name do
	        label "Course"
	      end

	       field :dateDay, :datetime do
	        label "Date"
	        strftime_format "%d-%m-%Y"
	      end
	    end
	end
end
