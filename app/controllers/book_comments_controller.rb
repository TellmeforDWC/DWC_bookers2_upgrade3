class BookCommentsController < ApplicationController
  before_action :ensure_correct_user, only: [:destroy]

  def create
    @book = Book.find(params[:book_id])
    @user = @book.user
    @book_comment = BookComment.new(book_comment_params)
    @book_comment.book_id = @book.id
    @book_comment.user_id = current_user.id
    if @book_comment.save
      redirect_back(fallback_location: books_path, notice: "You have created book_comment successfully.")
    else
      flash[:error] = @book_comment.errors.full_messages
      redirect_to book_path(@book.id)
    end
  end

  def destroy
    BookComment.find_by(id: params[:id]).destroy
    redirect_back(fallback_location: books_path)
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:body)
  end

  def ensure_correct_user
    @book_comment = BookComment.find(params[:id])
    unless @book_comment.user_id == current_user.id
      redirect_to books_path
    end
  end

end
