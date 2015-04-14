class CommentsController < ApplicationControllere


	def create
	@product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to products_path(@product)
	end

	def destroy
	end
end
