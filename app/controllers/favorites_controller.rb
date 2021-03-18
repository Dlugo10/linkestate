class FavoritesController < ApplicationController

  def index
    @favorites = policy_scope(Favorite).order(created_at: :desc)

  end

  def create
    @property = Property.find(params[:property_id])
    @favorites = current_user.favorites



    if @favorites.present? && @favorites.find_by(property_id: @property.id).present?
      @favorite = @favorites.find_by(property_id: @property.id).destroy
      authorize @favorite
    else
      @favorite = Favorite.create( user_id: current_user.id, property_id: @property.id)
      authorize @favorite
    end




  end

  def destroy
    @property = Property.find(params[:property_id])
    @favorites = current_user.favorites

    @favorite = @favorites.find_by(property_id: @property.id)
    authorize @favorite
    @favorite.destroy
    redirect_to favorites_path
  end

end
