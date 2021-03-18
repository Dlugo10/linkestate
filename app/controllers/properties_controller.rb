class PropertiesController < ApplicationController
  def index
    if params[:query].present?
      @properties = policy_scope(Property).search_by_address(params[:query]).paginate(page: params[:page], per_page: 6)
      @markers = @properties.geocoded.map do |property|
        {
          lat: property.latitude,
          lng: property.longitude

        }

      end
    else
      @properties = policy_scope(Property).paginate(page: params[:page], per_page: 6)
      @properties=@properties.where(propery_type: params[:prop_type]) if params[:prop_type].present? # filters property type
      @properties=@properties.where("price >= ?", params[:price_from]) if params[:price_from].present? # filters min price
      @properties=@properties.where("price <= ?", params[:price_to]) if params[:price_to].present? # filters max price
      @properties=@properties.where("bathrooms >= ?", params[:min_bath]) if params[:min_bath].present? # filters min bathrooms
      @properties=@properties.where("bedrooms >= ?", params[:min_bed]) if params[:min_bed].present?    # filters min bedrooms
      @properties=@properties.where("sq_meters >= ?", params[:min_size]) if params[:min_size].present? # filters min square meter size

      @markers = @properties.geocoded.map do |property|
        {
          lat: property.latitude,
          lng: property.longitude
        }
      end
    end
  end

  def show
    @property = Property.find(params[:id])

    authorize @property
  end

  def new
    @property = Property.new
    # already coded the pundit authorizations, uncomment when enable pundit
    authorize @property
  end

  def create
    @property = Property.new(property_params)
    @property.user = current_user
    @property.save
    redirect_to properties_path

    authorize @property
  end

  def edit
    @property = Property.find(params[:id])
    # already coded the pundit authorizations, uncomment when enable pundit
    authorize @property
  end

  def update
    @property = Property.find(params[:id])
    # already coded the pundit authorizations, uncomment when enable pundit
    @property.update(property_params)
    redirect_to property_path(@property.id)

    authorize @property
  end

  def destroy
    @property = Property.find(params[:id])
    authorize @property
    @property.destroy
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
                                     :dishwasher, :washing_machine, :attached_garage, 
                                     :title, photos: []
                                     )
  end
end
