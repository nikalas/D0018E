class SessionsController < ApplicationController
  def new
  end

  def create
    user = Customer.find_by(email: params[:session][:email])
  if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path, :flash => {:success => "Welcome!"}
    else
      if user
        flash.now[:danger] = 'Wrong password'
      else
        flash.now[:danger] = 'No such user'
      end
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
