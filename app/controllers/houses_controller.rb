class HousesController < ApplicationController
  # before_action :set_house, only: [:show]

  def index
    @houses = House.all
  end

  def show
  end

  def new
    @house = House.new
  end

  def create
    @house = House.new(house_params)

    # connect
    @house.user = current_user

    if @house.save
      redirect_to houses_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
    @house = House.find(house_params)
  end

  def update
    @house = House.find(house_params)
    @house.update(params[:house])
    redirect_to houses_path
  end

  def destroy
    @house = House.find(params[:id])
    @house.destroy
    redirect_to houses_edit_path, status: :see_other
  end

  private

  def house_params
    params.require(:house).permit(:address, :name, :capacity, :photo)
  end

end
