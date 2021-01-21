class HolidayHomesController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :set_holiday_home, only: [:destroy]

  def index
    render json: holiday_home.all
  end

  def create
    @holiday_home = holiday_home.create!(holiday_home_params)
    render json: @holiday_home
  end

  # DELETE /holiday_homes:id
  def destroy
    @holiday_home.destroy
    head :no_content
  end

  private

  def holiday_home_params
    params.require(:holiday_home).permit(
      :title, :owner, :manager, :address, :image_url, :description, :email, :phone, :author
    )
  end

  def set_holiday_home
    @holiday_home = holiday_home.find(params[:id].to_i)
  end
end
