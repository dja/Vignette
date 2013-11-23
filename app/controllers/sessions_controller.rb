require 'json'
class SessionsController < ApplicationController

  def new
    invite = Invitation.find_by_token(params[:invitation_token])
    session[:current_token] = invite
  end

  def create
    if session[:current_token] == nil
      user = User.login_from_omniauth(env["omniauth.auth"])
      if user == 'not ready'
        redirect_to root_url
      elsif user == 'closed'
        redirect_to new_invitation_url
      elsif user.type == "Customer"
        @customer = user
        session[:user_id] = @customer.id
        redirect_to @customer
      elsif user.type == "Photographer"
        @photographer = user
        session[:user_id] = @photographer.id
        redirect_to @photographer
      else
        redirect_to new_invitation_url
      end
    else
      invite = session[:current_token]
      session[:current_token] = nil
      if invite.sent_at == nil
        redirect_to notready_url
      elsif invite.user_type == "Customer"
        @customer = Customer.from_omniauth(env["omniauth.auth"])
        session[:user_id] = @customer.id
        invite.destroy
        redirect_to @customer
      elsif invite.user_type == "Photographer"
        @photographer = Photographer.from_omniauth(env["omniauth.auth"])
        session[:user_id] = @photographer.id
        invite.destroy
        redirect_to @photographer
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