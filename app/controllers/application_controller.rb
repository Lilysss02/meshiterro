class ApplicationController < ActionController::Base
	# before_actionメソッドで指定されたメソッドはこのコントローラが実行される前に実行される
	before_action :configure_permitted_parameters, if: :devise_controller?
	# ログイン認証がされていなければrootパスへリダイレクト
	before_action :authenticate_user!

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	end
end
