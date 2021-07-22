class UsersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  def show
    user = User.find(params[:id])
    render json: user, include: :items
  end

  private

  def render_not_found
    render json: {error: "Not Found"}, status: :not_found
  end

end
