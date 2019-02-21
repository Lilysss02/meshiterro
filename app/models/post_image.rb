class PostImage < ApplicationRecord
	# PostImageモデルからuser_idに紐づいてUserモデルを参照できる
	belongs_to :user
	# new.html.erbとともに画像をアップロードするためのメソッド(attachment_field)の追加
	attachment :image
	# PostCommentモデルを複数持つ
	has_many :post_comments, dependent: :destroy
	# Favoritesモデルを複数持つ
	has_many :favorites, dependent: :destroy

	validates :shop_name, presence: true
	validates :image, presence: true

	# 引数で渡されたユーザのidがFavoritesテーブル内に存在（exists?）しているかを調べる
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end
