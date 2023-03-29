class ApplicantsController < ApplicationController

  #skip_before_action :authorize, only: [:create, :show, :index]

  def index
    render json: Applicant.all
  end



  def show
    applicant = Applicant.find_by(id: session[:applicant_session_id])
    if applicant
      render json: applicant
    else
      render json: { error: "Not authorized" }, status: :unauthorized
    end
  end


# def signup
#     applicant = Applicant.create!(sign_in_applicant_params)
#     render json: applicant, status: :ok
# end


# def login
#   applicant = Applicant.find_by(:username: log_in_params[:username])
#   if applicant
#     if applicant.authenticate(password: login_params[:password])
#         session[:username] = applicant.id
#         return render json: applicant
#     end
#   end
#   render json: {error: "Invalid username or password"}, status: :not_found

# end


def update
    applicant = find_applicant
    applicant.update!(applicant_params)
    render json: applicant, except: [:created_at, :updated_at], status: :created
end

def destroy
    applicant = find_applicant
    applicant.destroy
    head :no_content
end

private

def find_applicant
    Applicant.find(params[:id])
end

  def applicant_params
    params.permit(:id, :username, :first_name, :last_name, :age, :date_of_birth, :email, :password)
 end

 def log_in_params
   params.permit(:username, :password)
 end

end
