class Answer < ApplicationRecord
	validates :name, presence: true, uniqueness: true
	validates :question_id, presence: true
	has_many :results

	belongs_to :question
	rails_admin do
		label "Answer"
		list do
	      
	      field :name do
	        label "Name"
	      end

	      field :question_id do
	        label "Question"
	        formatted_value do 
	          Question.find_by(id: value).name
	        end
	      end

	      field :correct_status do
	        label "Correct"
	      end
	    end
	    edit do
	      
	      field :name do
	        label "Name"
	      end

	      field :question_id, :enum do
	        label "Question"
	        enum do
	        	@question = Question.all.where(is_delete: false).map { |lst| [lst.name, lst.id] }
	        end
	      end

	      field :correct_status do
	        label "Correct"
	      end
	    end
	end
end
