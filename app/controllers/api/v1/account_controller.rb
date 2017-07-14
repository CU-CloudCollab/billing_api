module API
  module V1
    class AccountController < ApplicationController
      before_action :authenticate

      def index
        if @current_user.admin?
          if params[:month] && params[:year]
            @details = []
            @details_array = ActiveRecord::Base.connection.execute("select linked_account_id, kfs_account, cost_center, business_purpose, sum(unblended_cost) from billing_detail a, aws_accounts b where a.month = '#{params[:month]}' and a.year = '#{params[:year]}' and a.linked_account_id = b.account_number group by linked_account_id, cost_center, business_purpose, kfs_account")

            @details_array.each do |detail|
              @details.push({
                aws_account: detail[0],
                kfs_account: detail[1],
                cost_center: detail[2],
                business_purpose: detail[3],
                cost: detail[4],
                })
            end
            render json: { account_detail: @details}
          else
            render json: 'Must supply year and month', status: 501
          end
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
            @details = BillingDetail.linked_account(params[:id]).by_month(params[:month]).by_year(params[:year]).group(:cost_center).sum(:unblended_cost)
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
