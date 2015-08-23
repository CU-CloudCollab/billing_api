require 'securerandom'

module API  
  module V1
    class UserController < ApplicationController
      before_action :authenticate
       
      def create
        if @current_user.admin?
          @user = User.create
          if params[:account]
            UserAccount.create(user: @user, account_num: params[:account])
          end
          render json: @user
        else
          render json: 'Bad credentials', status: 401
        end
      end
      
      def destroy
        if @current_user.admin? or @current_user.api_key.eql?(params[:id])
          User.where(api_key: params[:id]).first.destroy
          render json: "delete api key: #{params[:id]}", status: 200
        else
          render json: 'Bad credentials', status: 401
        end
      end
      
    end
  end
end