class BillsController < ApplicationController

    before_action :authenticate_user

    def index
        bills = Bill.where(user_id: @user.id)

        render json: user_goals, :include => :tasks
    end

    def create
        bill = Bill.create(
            title: params[:title],
            user_id: @user.id,
            amount_due: params[:amount_due],
            due_date: params[:due_date]
        )
        if bill.errors.any?
            render json: {errors: bill.errors}
        else
            render json: bill
        end
    end


end
