class BillsController < ApplicationController

    before_action :authenticate_user

    def index
        bills = Bill.where(user_id: @user.id)

        render json: bills
    end

    def show
        bill = Bill.find_by(id: params[:id])

        if bill && bill.user_id == @user.id
            render json: bill
        else 
            render status: :unauthorized
        end 
    end

    def create
        bill = Bill.create(
            title: params[:title],
            user_id: @user.id,
            amount_due: params[:amount_due],
            due_date: params[:due_date],
            interest_rate: params[:interest_rate],
            balance: params[:balance]
        )
        if bill.errors.any?
            render json: {errors: bill.errors}
        else
            render json: bill
        end
    end

    def update
        bill = Bill.find(params[:id])
        bill.update(bill_params)

        if bill.errors.any?
            render json: {errors: bill.errors}
        else
            render json: bill
        end

    end

    def destroy
        bill = Bill.find(params[:id])
        bill.destroy
        render json: bill
    end

    private

    def bill_params
        params.require(:bill).permit(:user_id, :title, :due_date, :amount_due, :interest_rate, :balance)
    end


end
