class PhysiciansController < ApplicationController
  before_action :current_physician, only: [:show, :edit, :destroy, :update]
  def index
    @physicians = Physician.all
  end
  def show
  end

  def new
    @physician = Physician.new
  end

  def create
    @physician = Physician.new(physician_params)
    if @physician.save
      redirect_to @physician
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @physician.update(physician_params)
      redirect_to @physician
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @physician.destroy
    redirect_to physicians_path, status: :see_other
  end
    

  def physician_params
    params.require(:physician).permit(:name)
  end

  def current_physician
    @physician = Physician.find(params[:id])
  end
end
