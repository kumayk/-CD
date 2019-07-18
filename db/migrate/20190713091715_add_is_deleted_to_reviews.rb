class AddIsDeletedToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :is_deleted, :boolean
  end
end
