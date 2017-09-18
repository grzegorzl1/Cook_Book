class SessionsController < ApplicationController
  def new
    if request.get?
      render
    else 
      admin = Admin.authenticate(params[:session][:login], params[:session][:password])
      if admin.nil?
        render
      else
        flash[:notice] = "Successfully signed in"
        session[:admin_id] = admin.id
        redirect_to root_path
      end
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to "/"
  end
end
