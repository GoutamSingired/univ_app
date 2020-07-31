class StudentsController < ApplicationController
  skip_before_action :require_user, only: [:new, :create]
  before_action :student_id, only: [:show, :edit, :update ]
  before_action :require_same_user, only: [:edit, :update]

  def index
    @students = Student.all
  end

  def show

  end

  def new
    @student = Student.new()
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:notice] = "You have sucessfully signed up."
      redirect_to @student
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @student.update(student_params)
      flash[:notice] = "changes updated sucessfully"
      redirect_to @student
    else
      render 'edit'
    end
  end

  private

    def student_id
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:name, :email, :password, :password_confirmation)
    end

    def require_same_user
      if current_user != @student
        flash[:notice] = "you can edit only your own profile"
        redirect_to student_path(current_user)
      end
    end

end
