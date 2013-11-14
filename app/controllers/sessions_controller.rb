require 'json'
class SessionsController < ApplicationController
  def new
  end

  def create
    auth = request.env["omniauth.auth"]
    user = User.where(provider: auth['provider'],
                      uid: auth['uid']).first || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to user_path(user), notice: "Signed in!"
  end

  def destroy
    reset_session
    redirect_to root_url
  end

  def failure
    render :text => "Something went wrong. Why don't you try again?", :status => :bad_request
  end

end