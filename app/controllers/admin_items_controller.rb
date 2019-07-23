class AdminItemsController < ApplicationController

def index
	@items = Item.all
end

def show
  @item = Item.find(params[:id])
end

###newアクション###
def new
	@item = Item.new
	@disk = @item.disks.build
	@song = @disk.songs.build
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
	if @item.save!
	   redirect_to admin_item_path(@item.id)
	else
       render :new
   end
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
	@item = Item.find(params[:id])
	@disk = @item.disks.build
	@song = @disk.songs.build
end

def update
	item = Item.find(params[:id])
	item.update(item_params)
	redirect_to admin_item_path(item.id)
end

def destroy
	@item = Item.find(params[:id])
	@item.destroy
	redirect_to new_admin_item_path
end

private

  def item_params
     params.require(:item).permit(:image, :disk_name, :image_id, :stock, :price, :item_status, :artist_id, :label_id, :category_id, :disk_id, disks_attributes: [:id, :disk_name, :item_id, songs_attributes: [:id, :song_name, :truck_number]])
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
