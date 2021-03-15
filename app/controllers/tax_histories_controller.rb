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
    @tax_history = TaxHistory.find(params[:id])
    authorize @tax_history
  end

  def update
    @tax_history = TaxHistory.find(params[:id])
    authorize @tax_history
    @tax_history.update(tax_history_params)
    redirect_to property_path
  end

  private

  def tax_history_params
    params.require(:tax_history).permit(:tax, :value, :year)

  end

end
