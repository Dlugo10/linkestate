class TaxHistoriesController < ApplicationController

  def index
    @property = Property.find(params[:property_id])
    @tax_history = policy_scope(TaxHistory).order(created_at: :desc)

    authorize @tax_history
  end


  def new
    #DAVID
    @property = Property.find(params[:property_id])
    @tax_history = TaxHistory.new
    @tax_history.property = @property

    authorize @tax_history
  end

  def create
    #DAVID
    @property = Property.find(params[:property_id])
    @tax_history = TaxHistory.new(tax_history_params)
    @tax_history.property = @property
    @tax_history.save

    authorize @tax_history
    redirect_to  property_tax_histories_path(params[:property_id])
    
  end

  def edit
    @property = Property.find(params[:property_id])
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
