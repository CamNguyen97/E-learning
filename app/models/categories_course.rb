class CategoriesCourse < ApplicationRecord
	belongs_to :user
	belongs_to :course
	
	rails_admin do
		label "Category"
		list do
		  field :user_id do
		    label "User"
		    formatted_value do 
		      User.find_by(id: value).name
		    end
		  end

		  field :course_id do
		    label "Course"
		    formatted_value do 
		      Course.find_by(id: value).name
		    end
		  end

		  field :status do
		    label "Learn"
		  end
		end

		edit do
	        field :user_id, :enum do
		    label "User"
		    enum do 
		      @user = User.all.where(is_delete: false).map { |lst| [lst.name, lst.id] }
		    end
		  end

		  field :course_id, :enum do
		    label "Course"
		    enum do 
		      @course = Course.all.where(is_delete: false).map { |lst| [lst.name, lst.id] }
		    end
		  end

		  field :status do
		    label "Learn"
		  end
	    end
	end
end
