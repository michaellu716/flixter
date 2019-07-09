class LessonsController < ApplicationController
	before_action :authenticate_user!
	before_action :require_authorized_for_current_lesson, only: [:show]

	def show
		current_lesson
	end


	private

	helper_method :current_lesson
	def current_lesson
	    @current_lesson ||= Lesson.find(params[:id])
	end

	def require_authorized_for_current_lesson
    	if current_user.enrolled_in?(@course)
    		 redirect_to courses_path, alert: 'register for the course'
    	end
    end

end

