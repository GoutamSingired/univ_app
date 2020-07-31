class CourcesController < ApplicationController
  skip_before_action :require_user 


  def index
    @cources = Cource.all
  end

  def new
  end
end
