class UsercoursesController < ApplicationController
  def index
  	@courses = Course.list_course(current_user.id).page(params[:page] || 1).per 6
  end
end
