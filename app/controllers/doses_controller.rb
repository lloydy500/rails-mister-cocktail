class DosesController < ApplicationController

  def index
    @doses = dose.all
  end

  def show
    @dose = dose.find(params[:id])
  end

  def new
    @dose = dose.new
  end

  def create
    @dose = dose.new(dose_params)
    
    if @dose.save
      redirect_to dose_path(@dose)
    else
      render :new
    end
  end
  
  def edit
    @dose = dose.find(params[:id])
  end

  def update
    @dose = dose.find(params[:id])
    @dose.update(dose_params)
  end

 def destroy
    @dose = dose.find(params[:id])
    @dose.destroy

    # no need for app/views/doses/destroy.html.erb
    redirect_to doses_path
  end
  
  private

  def dose_params
    params.require(:dose).permit(:name)
  end

end
