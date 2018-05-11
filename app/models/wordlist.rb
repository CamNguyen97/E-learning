class Wordlist < ApplicationRecord
	belongs_to :course
	has_many :questions
	validates :name, presence: true, uniqueness: true
	validates :from_translator, presence: true, uniqueness: true
	validates :course_id, presence: true, uniqueness: true

	rails_admin do
		label "List Word"
	    list do

	      field :name do
	        label "Word"
	      end

	       field :from_translator do
	        label "Translate"
	      end
	    end

	    edit do

	      field :name do
	        label "Word"
	      end

	       field :from_translator do
	        label "Translate"
	      end

	      field :course_id, :enum do
	        label "Course"
	        enum do 
		       @Course = Course.all.where(is_delete: false).map { |lst| [lst.name, lst.id] }
		    end
	      end
	    end
  	end
end
