class Course < ApplicationRecord
	validates :name, presence: true, uniqueness: true
	validates :dateDay, presence: true, uniqueness: true
	has_many :categoriesCourses
	has_many :users, through: :categoriesCourses

	scope :list_course, -> u_id do
	select("*").
	includes(:categoriesCourses)
	.where(id: (CategoriesCourse.all.where(user_id: u_id)
		.select(:course_id))).order(name: :asc)
	.group("courses.id").all
  end
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
