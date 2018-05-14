class PagesController < ApplicationController
  def home
  	@courses_list = Course.list_course(current_user.id)
  end

  def index
  end

  def edit
  	List_answer(params[:id])
  end

  def new
    List_answer(params[:format])
  end

  def create

  end

  private
  def List_answer pr_course_id
    @answers = Question.where( wordlist_id: Wordlist.where(course_id: pr_course_id)
      .includes(:questions).select{"id"}).all
  end
end
