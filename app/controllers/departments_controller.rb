class DepartmentsController < ApplicationController

  def index
    departments = Department.where(country_id: params[:country_id]).select(:id, :name)
    render json: departments
  end

end
