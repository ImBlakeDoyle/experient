class TransactionsController < ApplicationController
before_action :authenticate_user!
before_action :add_params
    def new
        @transaction = Transaction.new
    end

    def create
        @transaction = Transaction.new(add_params)
        @transaction.user_id = current_user.id
    end

    def add_params
        params.require(:product_id)
    end
end
