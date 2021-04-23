class SessionsController < ApplicationController
  def new
  end

  def create
    # redirects to the login page if :name is nil
    # redirects to login page if :name is empty
    # sets session[:name] if :name was given
    # redirects to "/" if logged in
    return redirect_to(controller: 'sessions', action: 'new') if !params[:name] || params[:name].empty?
      session[:name] = params[:name]
      redirect_to controller: 'application', action: 'hello'

    # if !params[:name] || params[:name].empty?
    #   redirect_to 'login'
    # else
    #   session[:name] = params[:name]
    #   redirect_to '/'
    # end

  end

  def destroy
    # leaves session[:name] nil if it was not set
    # clears session[:name] if it was set
    session.delete :name
    redirect_to controller: 'application', action: 'hello'
  end
end
