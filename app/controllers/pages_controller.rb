class PagesController < ApplicationController


  def home
  	@courses_list = Course.list_course(current_user.id)
  end

  def index
  end

  def show
    List_answer(params[:id])
  end

  def new
    List_answer(params[:format])
    cookies.signed[:course] = params[:format]
    @user_id = current_user.id
  end

  def save_answer
    object = JSON.parse(params[:page_id])
    @r = cookies.signed[:course]
    @course = wordlist
    if Result.create object
      @cc =  CategoriesCourse.find_by( user_id: current_user.id, course_id:cookies.signed[:course])
      @cc.update_attributes status: true
    else
      render :new
    end
  end

  private
  def List_answer pr_course_id
    @answers = Question.where( wordlist_id: Wordlist.where(course_id: pr_course_id))
    @result = Result.where(question_id:Question.where( wordlist_id: Wordlist.where(course_id: pr_course_id)))
  end

end
