class TaxHistoriesController < ApplicationController
  def index
    #Alston
  end

  def show 
    #Alston
  end

  def new
    #DAVID
    @tax_history = TaxHistory.new

  end

  def create
    #DAVID
    @tax_histories = TaxHistory.new(tax_history_params)
    @tax_histories.save

    redirect_to property_tax_histories_path(:property_id)

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
