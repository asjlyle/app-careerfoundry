class CommentsController < ApplicationController

	#validates :body, presence: true
  	#validates :rating, presence: true, numericality: { only_integer: true }

	def create
	@product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @product, notice: 'Review was created successfully.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { redirect_to @product, alert: 'Review was not saved successfully.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@product = @comment.product
		@comment.destroy
		redirect_to @product,alert: 'Comment Successfully deleted'
	end

	private

  def comment_params
    params.require(:comment).permit(:body, :rating)
  end
end
 