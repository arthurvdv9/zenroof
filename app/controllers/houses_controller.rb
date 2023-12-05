class HousesController < ApplicationController
  before_action :set_house, only: [:show]

  def index
    @houses = current_user.houses
    # if params[:query].present?
    #   sql_subquery = "name ILIKE :query OR address ILIKE :query"
    #   @house = @houses.where(sql_subquery, query: "%#{params[:query]}%")
    # end
  end

  def show
    @room = Room.new
    @house = House.find(params[:id])
  end

  def new
    @house = House.new
  end

  def create
    @house = House.new(house_params)

    # connect
    @house.user = current_user
    @room = Room.new

    if @house.save
      redirect_to house_path(@house)
      # respond_to do |format|
      #   format.html { redirect_to house_path(@house) }
      #   format.json
      # end

    else
      render :new, status: :unprocessable_entity
      # respond_to do |format|
      #   format.html { render :new, status: :unprocessable_entity }
      #   format.json
      # end
    end
  end

  def edit
    puts "hello edit"
    @house = House.find(params[:id])
  end

  def update
    puts "hello update"
    @house = House.find(params[:id])
    @house.update(house_params)
    @room = Room.new
    redirect_to house_path(@house)

    # respond_to do |format|
    #   format.html { redirect_to house_path(@house) }
    #   format.text { render partial: "houses/houseDetails", locals: { house: @house, room: @room }, formats: [:html] }
    # end
  end

  def destroy
    @house = House.find(params[:id])
    @house.destroy
    redirect_to dashboard_path, status: :see_other
  end

  private

  def set_house
    @house = House.where(user_id: current_user)
  end

  def house_params
    params.require(:house).permit(:address, :name, :capacity, :photo)
  end

end
