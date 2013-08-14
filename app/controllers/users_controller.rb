class UsersController < ApplicationController
  def signin
    auth = request.env['omniauth.auth']
    username = auth.extra.raw_info.username
    access_token = auth.credentials.token

    user = User.where(username: username, access_token: access_token).first_or_create

    session[:user_id] = user.id

    redirect_to items_path, success: 'You have signed in.'
  end

  def signout
    session[:user_id] = nil

    redirect_to root_path, success: 'You have successfully signed out.'
  end
end
