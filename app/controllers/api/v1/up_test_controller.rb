module API
  module V1
    class UpTestController < ApplicationController

      def index
        CurrentMonth.first
        render json: 'Site is up! GIT TEST11', status: 200
      end

    end
  end
end
