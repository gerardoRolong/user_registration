class CitiesController < ApplicationController
  def index
    departments = City.where(department_id: params[:department_id]).select(:id, :name)
    render json: departments
  end  
end
