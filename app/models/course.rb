class Course < ApplicationRecord
	validates :name, presence: true, uniqueness: true
	validates :dateDay, presence: true, uniqueness: true
	has_many :categoriesCourses
	has_many :wordlists
	has_many :questions, through: :wordlists
	has_many :users, through: :categoriesCourses
	# has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	scope :list_course, ->(u_id) {
	includes(:categoriesCourses).where(id: (CategoriesCourse.all.where(user_id: u_id)
		.select(:course_id))).order(name: :asc)
	.group("courses.id").all
  }
  scope :list_course_learnd, ->(u_id) {
	includes(:categoriesCourses).where(id: (CategoriesCourse.all.where(user_id: u_id, status: true)
		.select(:course_id))).order(name: :asc)
	.group("courses.id").all
  }
  mount_uploader :image, ImageUploader

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

	      field :image do
	        label "image"
	        pretty_value do
       			bindings[:view].tag(:img, { :src => bindings[:object].image.url(bindings[:object], :image, :fill, 100, 100)})
      		end
      		html_attributes do
    			{width: 300, height: 200}
 			 end
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

	      field :image do
	        label "image"
	        pretty_value do
       			bindings[:view].tag(:img, { :src => bindings[:object].image.url(bindings[:object], :image, :fill, 100, 100)})
      		end
	      end

	    end
	end
end
