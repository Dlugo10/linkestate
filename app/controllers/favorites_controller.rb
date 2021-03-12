class FavoritesController < ApplicationController

  def index
    @favorites = policy_scope(Favorite).order(created_at: :desc)

  end

  def create
    @property = Property.find(params[:property_id])
    @favorite = Favorite.new
    @favorite.user = current_user
    property_saved = @favorite.property = @property
    @favorite.save
    @favorites_hash = Favorite.all
    
      @favorites_hash.each do |f|

        if property_saved.id == f.property_id

          property_saved.save!
        end
      end

    authorize @favorite
  end

end
