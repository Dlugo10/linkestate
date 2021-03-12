class PropertiesController < ApplicationController
  def index
    @properties = policy_scope(Property).order(created_at: :desc)


      if params[:query].present?
        @properties = Property.search_by_address(params[:query])
        @markers = @properties.geocoded.map do |property|
          {
            lat: property.latitude,
            lng: property.longitude
          }
        end
      else
        @properties = Property.all
        @markers = @properties.geocoded.map do |property|
          {
            lat: property.latitude,
            lng: property.longitude
          }
        end
    end
  end

  def show
    @properties = Property.find(params[:id])
  end

  def new
    @property = Property.new
    # already coded the pundit authorizations, uncomment when enable pundit
    # authorize @property
  end

  def create
    @property = Property.new(property_params)
    @property.user = current_user
    @property.save
    redirect_to properties_path

    authorize @restaurant
  end

  def edit
    @property = Property.find(params[:id])
    # already coded the pundit authorizations, uncomment when enable pundit
    # authorize @property
  end

  def update
    @property = Property.find(params[:id])
    # already coded the pundit authorizations, uncomment when enable pundit
    # authorize @property
    @property.update(property_params)
    redirect_to properties_path
  end

  private

  def property_params
    params.require(:property).permit(:user_id, :price, :address, :city, :zip_code,
                                     :neighborhood_info, :neighborhood, :sq_meters,
                                     :estimated_price, :bedrooms, :bathrooms,
                                     :sq_meters_land, :year_bought, :price_bought,
                                     :sq_meters_added, :year_built, :year_renovated,
                                     :latitude, :longitude, :beachfront,
                                     :waterfront, :pool, :propery_type, :central_air,
                                     :dishwasher, :washing_machine, :attached_garage, :title
                                     )
  end
end
