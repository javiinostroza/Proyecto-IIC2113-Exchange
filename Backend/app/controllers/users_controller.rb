class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    if params[:id] === current_user.id.to_s
      render json: current_user
    else
      render json: {}, status: :unauthorized
    end
  end
end
