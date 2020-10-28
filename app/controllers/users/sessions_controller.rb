# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # アカウント切り替え時のuser_communities#updateの処理を元に、@started_sessionを特定
   protected
  def after_sign_in_path_for(resource)
    if @started_session = current_user.user_communities.order(:updated_at).last
      community_path(@started_session.community_id)
    else
      new_user_community_path
    end
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
