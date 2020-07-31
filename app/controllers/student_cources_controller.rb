class StudentCourcesController < ApplicationController

  def create
    cource_to_add = Cource.find(params[:cource_id])
    unless current_user.cources.include?(cource_to_add)
      StudentCource.create(cource: cource_to_add, student: current_user)
      flash[:notice] = "You are succesfully enrolled in a cource"
      redirect_to current_user
    else
      flash[:notice] = "There is something went wrong"
      redirect_to root_path
    end

  end


end
