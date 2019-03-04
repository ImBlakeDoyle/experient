class MainController < ApplicationController 
    # before_action :authenticate_user!
    def main
        @product = Product.all
        render json: @product
    end

    def home
        # @business = current_user.business
        @featured = Product.where(id: Product.pluck(:id).sample(3))
    end

    def show
        @my_businesses = Business.where(user_id: current_user)
        @business = current_user.business
        @my_products = Product.where(user_id: current_user)
        @productreviews = ProductReview.where(user_id: current_user)
        @my_user = User.where(id: current_user)
        #@transactions = Transaction.where(user_id: current_user)
        @transactions = current_user.transactions

    end
        
    def update
        current_user.avatar = params[:avatar]
        current_user.save
        redirect_to profile_path
    end

    # def save_avatar
    #     params.require(current_user).permit(:avatar)
    # end
end