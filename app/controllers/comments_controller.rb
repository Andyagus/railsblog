class CommentsController < ApplicationController

   def create
      # @comment = Comment.new(comment_params)
      @comment = current_user.comments.create(params[:comment])
   end

end
