class CommentsController < ApplicationController
  # GET /books/:book_id/comments
  def index
    render json: book.comments.order(stars: :desc).page(params[:page]).per(params[:per])
  end

  # POST /books/:book_id/comments
  def create
    comment = book.comments.create(comment_params)

    if comment.save
      render status: :ok
    else
      render json: {
        error:  comment.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  private

  def book
    Book.find(params[:book_id])
  end

  def comment_params
    params.permit(:nickname, :content, :stars)
  end
end
