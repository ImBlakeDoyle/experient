class SearchController < ApplicationController
    def index
        # @books = Book.search(params[:search])
    end

    def search_result
        @products = Product.search(params[:search])
    end

    def advanced_search
        @groups = AgeGroup.pluck("range","id")
        @category = Category.pluck("category","id")

    end

    def advanced_search_process

        # query = Product.all   
        query = Product.where("keywords ILIKE ?","%#{params[:keywords]}%")
                 .where(category_id: params[:category_id].to_i)
                 .where("cost >= ?",params[:min_cost].to_f)
                 .where("cost <= ?",params[:max_cost].to_f)
                 .where(age_group_id: params[:age_group_id].to_i)

        # render json: query
        # redirect_to advance_search_result_path
    end
    def advanced_search_result
        @result = advanced_search_process
    
        # puts "test"

    end
end