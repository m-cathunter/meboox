class AuthorsController < ApplicationController
  # GET /authors
  def index
    render json: Author.all
  end
end
