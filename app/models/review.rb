class Review < ApplicationRecord
	 belongs_to :user
     belongs_to :item
     validates:review_comment,presence: true
     validates:item_id,presence: true
     validates:user_id,presence: true
end
