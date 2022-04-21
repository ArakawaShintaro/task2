class BookCommentsController < ApplicationController
  before_action :correct_user, only: [:destroy]

  def create
    comment = current_user.book_comments.new(comment_params)
    comment.book_id = Book.find(params[:book_id]).id
    comment.save
    redirect_back(fallback_location: books_path)
  end

  def destroy
    comment = current_user.book_comments.find(params[:book_comment_id])
    comment.destroy
    redirect_back(fallback_location: books_path)
  end

  private
  def comment_params
    params.require(:book_comment). permit(:user_id, :book_id, :content)
  end

   def correct_user
    comment = BookComment.find(params[:book_comment_id])
  	unless comment.user_id == current_user.id
  		redirect_to user_path(current_user)
  	end
   end
end
