class PasswordResetsController < ApplicationController

  def new
  end

  def create

    @user = User.find_by(email: params[:email])

    if @user.present?
      # send an email
      PasswordMailer.with(user: @user).reset.deliver_now
      redirect_to root_path, notice: "Password reset email sent"
    else
      redirect_to root_path, notice: "Password reset email sent"
    end
  end

  def edit

    @user = User.find_signed!(params[:token], purpose: "password_reset")
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to sign_in_path, alert: "Your token has expired."
  end

  def update

    
  end
  
end