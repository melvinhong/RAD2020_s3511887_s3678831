class VerificationsController < ApplicationController
  before_action :logged_in?, only: [:create]
  before_action :correct_user, only: [:edit, :update]
  skip_before_action :verify_authenticity_token
  
  include VerificationsHelper
  def create
    if current_user.create_verification(verification_params)
      flash[:success] = "Success!"
      redirect_to setting_path
    else
      flash[:alert] = "Fail!"
      redirect_to setting_path
    end
  end

  def show
    redirect_to current_user
  end

  private
  def verification_params
    params.require(:verification).permit(:fullname,:cardnumber, :card)
   end

end
