class CommentsController < ApplicationController
  # GET /books/:book_id/comments
  def index
    render json: book.comments
  end

  private

  def book
    Book.find(params[:book_id])
  end
end
