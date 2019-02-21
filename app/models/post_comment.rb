class PostComment < ApplicationRecord
	# UserモデルもPostImageモデルも関連づけられるのは1つ
	belongs_to :user
	belongs_to :post_image
end
