class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_manyの後に1:Nの関係になるモデル名の複数形を記述
  # PostImageモデルにUserモデルとの関連付けを追加
  # dependent: :destroyはhas_manyで使えるオプションで、1:Nの関係の1のデータが削除された時、関連するNのデータも削除する設定。
  has_many :post_images, dependent: :destroy
  # PostCommentモデルにUserモデルとの関連付けを追加
  has_many :post_comments, dependent: :destroy
  # FavoriteモデルにUserモデルとの関連付けを追加
  has_many :favorites, dependent: :destroy
  # 画像投稿のためにRefileを使うため、追加したカラム名(profile_image_id)から_idをとったprofile_imageを記述
  attachment :profile_image
end
