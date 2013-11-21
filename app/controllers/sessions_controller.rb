require 'json'
class SessionsController < ApplicationController

  def new
    invite = Invitation.find_by_token(params[:invitation_token])
    session[:current_token] = invite
    @user_type = invite.user_type
  end

  def create
    if session[:current_token] == nil
      redirect_to signup_url
    else
      invite = session[:current_token]
      session[:current_token] = nil
      if invite.user_type == "Customer"
        @customer = Customer.from_omniauth(env["omniauth.auth"])
        session[:user_id] = @customer.id
        invite.destroy
        redirect_to @customer
      elsif invite.user_type == "Photographer"
        photographer = Photographer.from_omniauth(env["omniauth.auth"])
        session[:user_id] = photographer.id
        invite.destroy
        redirect_to photographer
      else
        redirect_to root_url
      end
    end
  end

  def destroy
    reset_session
    redirect_to root_url
  end

  def failure
    render :text => "Something went wrong. Why don't you try again?", :status => :bad_request
  end

end