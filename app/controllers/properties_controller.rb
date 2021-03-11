class PropertiesController < ApplicationController


  def index
    @properties = Property.all
  end

  def show
    @property = Property.find(params[:id])

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    # already coded the pundit authorizations, uncomment when enable pundit
    # authorize @property
    @property.user = current_user
    @property.save
    redirect_to properties_path
  end

  def edit
    @property = Property.find(params[:id])
    # already coded the pundit authorizations, uncomment when enable pundit
    # authorize @property
  end

  def update
    @property = Property.find(params[:id])
    @property.update(property_params)
    redirect_to properties_path
  end

  private

  def properties_params
    params.require(:property).permit(:user_id, :price, :address, :city, :zip_code,
                                     :neighborhood_info, :neighborhood, :sq_meters,
                                     :estimated_price, :bedrooms, :bathrooms,
                                     :sq_meters_land, :year_bought, :price_bought,
                                     :sq_meters_added, :year_built, :year_renovated,
                                     :latitude, :longitude, :beachfront,
                                     :waterfront, :pool, :propery_type, :central_air,
                                     :dishwasher, :washing_machine, :attached_garage, :title)
    end
  end
end
