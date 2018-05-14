module PagesHelper
	def category_status courses_list_id
		CategoriesCourse.find_by(course_id: courses_list_id)
	end

	def count_result question_ids
		count = 0
  	anwsers = Answer.where(question_id: question_ids)
  	anwsers.map{|answer| answer.choose_status == true && answer.correct_status == true ? count += 1 : count}
  	return count
	end

	def name_course pr_cours_id
		Course.find_by(id: pr_cours_id).name
	end
end
