class TaxHistoriesController < ApplicationController
  def index
    #Alston
  end

  def show 
    #Alston
  end

  def new
    #DAVID
    @property = Property.find(params[:property_id])
    @tax_history = TaxHistory.new
    authorize @tax_history
  end

  def create
    #DAVID
    @property = Property.find(params[:property_id])
    @tax_histories = TaxHistory.new(tax_history_params)
    @tax_histories.property = @property
    @tax_histories.save

    authorize @tax_histories
    redirect_to  property_tax_histories_path(params[:property_id])
    
  end

  def edit
# Matheus
  end

  def update
# Matheus
  end

  private

  def tax_history_params
    params.require(:tax_history).permit(:tax, :value, :year)

  end

end
