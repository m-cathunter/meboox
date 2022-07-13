class BooksController < ApplicationController
  # GET /books
  def index
    render json: Book.page(params[:page]).per(params[:per])
  end

  # GET /books/:id
  def show
    render json: Book.find(params[:id])
  end
end
