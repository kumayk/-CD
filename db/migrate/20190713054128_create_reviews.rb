class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :review_comment
      t.string :is
      t.boolean :deleted

      t.timestamps
    end
  end
end
