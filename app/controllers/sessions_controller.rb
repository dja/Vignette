require 'json'
class SessionsController < ApplicationController

  def new
  end

  def create
    if session[:user_type] == "Customer"
      customer = Customer.from_omniauth(env["omniauth.auth"])
      session[:user_id] = customer.id
      session[:user_type] = nil
      redirect_to customer
    elsif session[:user_type] == "Photographer"
      photographer = Photographer.from_omniauth(env["omniauth.auth"])
      session[:user_id] = photographer.id
      session[:user_type] = nil
      redirect_to photographer
    else
      redirect_to root_url
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