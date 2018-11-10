class ReviewsController < ApplicationController
  #before_action :set_review
  before_action :set_product


  def create
    @review = Review.new(review_params)

    @review.product = @product
    @review.user = current_user
    if @review.valid?
        @review.save!
    end
    redirect_to @product
  end


  def destroy

    @review = Review.find_by(id: params[:id])
    if @review.valid?
       @review.destroy
       redirect_to @product
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    #
    # def set_review
    #   @review = Review.find(params[:id])
    # end

    def set_product
      @product = Product.find_by(id: params[:product_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:description, :rating, :user_id, :product_id)
    end
end
