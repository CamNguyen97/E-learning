class Question < ApplicationRecord
	belongs_to :wordlist
	has_many :answers
	has_many :results
	validates :name, presence: true, uniqueness: true
	validates :wordlist_id, presence: true

	rails_admin do
	    list do
	      
	      field :name do
	        label "Question"
	      end

	      field :wordlist_id do
	        label "Word list"
	        formatted_value do 
		      Wordlist.find_by(id: value).name
		    end
	      end
	    end

	    edit do
	      field :name do
	        label "adsd"
	      end
	      field :wordlist_id, :enum do
	        label "Word"
	        enum do 
		       @Wordlist = Wordlist.all.where(is_delete: false).map { |lst| [lst.name, lst.id] }
		    end
	      end
	    end
  	end
end
