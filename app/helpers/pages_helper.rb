module PagesHelper
	def category_status courses_list_id, user_id
		CategoriesCourse.find_by(course_id: courses_list_id, user_id: user_id)
	end

	def count_result question_ids
		count = 0
	  	anwsers = Answer.where(question_id: question_ids).to_a
	  	results = Result.where(question_id: question_ids, user_id: current_user.id).to_a
  		anwsers.each do |valan, indexan|
  			results.each do |valre, indexre|
  				if valre.question_id == valan.question_id
  					if (valre.answer_id == valan.id && valan.correct_status == true)
  					 	count += 1
  					end
  				end
  			end
  		end
	  return count
	end

	def name_course pr_cours_id
		Course.find_by(id: pr_cours_id).name
	end

	def list_answer_wid wordlist_id
		answers = Answer.where(question_id: wordlist_id)
	end

	def result question_id, user_id
		Result.find_by(question_id: question_id, user_id: user_id)
	end

	def wordlist_learn
		course_learn = Course.list_course_learnd(current_user.id).select("id")
		count_word_list = Wordlist.where(course_id: course_learn)
	end
	def laycourse
		
	end

	def wordlist
		course_learn = Course.list_course(current_user.id).select("id")
		count_word_list = Wordlist.where(course_id: course_learn)
	end

	def new_word
		course_learn = Course.list_course_learnd(current_user.id).select("id")
		count_word_list = Wordlist.where.not(course_id: course_learn)
	end

	def user
		user_id = current_user.id
	end
end
