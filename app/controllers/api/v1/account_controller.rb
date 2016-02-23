module API
  module V1
    class AccountController < ApplicationController
      before_action :authenticate

      def index
        if @current_user.admin?
          @details = BillingDetail.all
          render json: @details
        else
          render json: 'Bad credentials', status: 401
        end
      end

      def show
        if @current_user.has_account_access?(params[:id]) or @current_user.admin?
          if params[:month] && params[:year]
            @details = BillingDetail.linked_account(params[:id]).by_month(params[:month]).by_year(params[:year])
            render json: @details
          else
            render json: 'Must supply year and month', status: 501
          end
        else
          render json: 'Bad credentials', status: 401
        end
      end

      def aggregate
        if @current_user.has_account_access?(params[:id]) or @current_user.admin?
          if params[:month] && params[:year]
            @details = BillingDetail.linked_account(params[:id]).by_month(params[:month]).by_year(params[:year]).group(:cost_center).sum(:blended_cost)
            render json: @details
          else
            render json: 'Must supply year and month', status: 501
          end
        else
          render json: 'Bad credentials', status: 401
        end
      end

    end
  end
end
