class AdminItemsController < ApplicationController

def index
end

def show
end

def new
	@item = Item.new
end

def create
	@item = Item.new(item_params)
	@item.save
	redirect_to new_admin_item_path
end

def edit
end

def update
end

def destroy
end

private
  def item_params
     params.require(:item).permit(:image, :disk_name, :image_id, :stock, :price, :item_status, :artist_id, :label_id, :category_id, :disk_id, artists_attributes: [:id, :artist_name], disks_attributes: [:id, :disk_name], songs_attributes: [:id, :song_name, :truck_number], lavels_attributes: [:id, :lavel_name], categories_attributes: [:id, :category_name],)
  end

end

