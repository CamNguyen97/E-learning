class UsercoursesController < ApplicationController
  def index
  	@search = Course.list_course(current_user.id).search params[:q]
  	@courses = @search.result.page(params[:page]).per params[:limit]
  	byebug
  end
end
