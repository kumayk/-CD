class Review < ApplicationRecord
	 belongs_to :user
     belongs_to :item
     validates:review_comment,presence: true
end
