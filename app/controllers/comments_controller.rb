class CommentsController < ApplicationController
  # GET /books/:book_id/comments
  def index
    render json: book.comments.page(params[:page]).per(params[:per])
  end

  private

  def book
    Book.find(params[:book_id])
  end
end
