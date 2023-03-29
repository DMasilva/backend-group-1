class CoursesController < ApplicationController

 # skip_before_action :authorize, only: [:index]

  def index
  render json: Course.all
  end

  def show
    course = find_course
    render json: course, status: :ok
  end



private

def find_course
    Course.find(params[:id])
end

end
