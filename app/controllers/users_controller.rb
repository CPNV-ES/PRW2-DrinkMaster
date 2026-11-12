class UsersController < ApplicationController
  allow_unauthenticated_access

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path, notice: "Successfully registered, please sign-in"
    else
      render :new, status: :unprocessable_content
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def user_params
      params.expect(user: [:email_address, :password, :password_confirmation])
    end
end
