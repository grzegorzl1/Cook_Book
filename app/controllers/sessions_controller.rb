class SessionsController < ApplicationController
  def new
    if request.get?
      render
    else
      user = User.authenticate(params[:session][:login], params[:session][:password])
      if user.nil?
        render
      else
        flash[:notice] = "Zostałeś poprawnie zalogowany"
        session[:user_id] = user.id
        redirect_to root_path
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/"
  end
end
