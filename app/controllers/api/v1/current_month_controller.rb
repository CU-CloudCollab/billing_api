module API  
  module V1
    class CurrentMonthController < ApplicationController
      before_action :authenticate
      
      def index
        if @current_user.admin?
          @details = CurrentMonth.all
          render json: @details 
        else
          render json: 'Bad credentials', status: 401
        end
      end
      
      def show
        if @current_user.has_account_access?(params[:id]) or @current_user.admin?
          @details = CurrentMonth.linked_account(params[:id])
          render json: @details
        else
          render json: 'Bad credentials', status: 401
        end
      end
      
    end
  end
end