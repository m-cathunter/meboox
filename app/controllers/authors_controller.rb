class AuthorsController < ApplicationController
  # GET /authors
  def index
    render json: Author.page(params[:page]).per(params[:per])
  end
end
