class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    comment = Comment.create!(comment_params)
    redirect_to request.referer
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.user = current_user
      comment.destroy!
    end
    redirect_to request.referer
  end

  private

  def comment_params
    prms = params.require(:comment).permit(:text, :offer_id)
    prms[:user] = current_user
    prms
  end
end
