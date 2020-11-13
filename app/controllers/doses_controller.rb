class DosesController < ApplicationController
  before_action :set_cocktail, except: %i[destroy]

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    
    if @dose.save
      redirect_to dose_path(@dose)
    else
      render :new
    end
  end


  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    # no need for app/views/doses/destroy.html.erb
    redirect_to doses_path
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
  
  
  private

  def dose_params
    params.require(:dose).permit(:name)
  end

end
