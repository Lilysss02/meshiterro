class UsersController < ApplicationController
  def show
  	# ユーザのデータを1件取得し、インスタンス変数へ渡す
  	@user = User.find(params[:id])
  	# pageメソッドを利用して全ての投稿画像が表示されないようにする
  	# @post_imagesにはそのユーザ(@user)に紐づいた投稿(.post_images)のみ渡すことができる
  	@post_images = @user.post_images.page(params[:page]).reverse_order
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	redirect_to user_path(@user.id)
  end

  private

  def user_params
  	params.require(:user).permit(:name, :profile_image)
  end
end
