module API
  module V1
    class UpTestController < ApplicationController

      def index
        begin
          CurrentMonth.first
          render json: 'Site is up!', status: 200
        rescue
          render json: 'Site is DOWN!', status: 500
        end
      end
    end
  end
end
