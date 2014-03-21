class SessionsController < ApplicationController

  def create
    auth_hash = request.env['omniauth.auth']

    if session[:user_id]
      # Means our user is signed in. Add the authorization to the user
      User.find(session[:user_id]).add_provider(auth_hash)

      render :text => "You can now login using #{auth_hash["provider"].capitalize} too!"
    else
      # Log him in or sign him up
      auth = Authorization.find_or_create(auth_hash)

      # Create the session
      session[:user_id] = auth.user.id
      redirect_to root_url, notice: "Welcome #{User.find(session[:user_id]).name}!"
      #render :text => auth_hash
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "You've Logged Out!"
  end

  def failure
    render :text => "Sorry, but you didn't allow access to our app!"
  end
end
