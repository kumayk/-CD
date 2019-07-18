class AdminItemsController < ApplicationController

def index
end

def show
end

###newアクション###
def new
	@item = Item.new
end

def artistnew
	@artist = Artist.new
end

def labelnew
	@label = Label.new
end

def categorynew
	@category = Category.new
end

#################

###createアクション###
def create
	@item = Item.new(item_params)
	@item.save
	redirect_to new_admin_item_path
end

def artistcreate
	@artist = Artist.new(artist_params)
	@artist.save
	redirect_to new_admin_item_path
end

def labelcreate
	@label = Label.new(label_params)
	@label.save
	redirect_to new_admin_item_path
end

def categorycreate
	@category = Category.new(category_params)
	@category.save
	redirect_to new_admin_item_path
end

###################

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

  def artist_params
     params.require(:artist).permit(:artist_name)
  end

  def label_params
     params.require(:label).permit(:label_name)
  end

  def category_params
     params.require(:category).permit(:category_name)
  end

end

