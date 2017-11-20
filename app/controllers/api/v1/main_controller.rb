module Api
  module V1

    class MainController < ActionController::API

      def index

        render json: {message: 'Главная'}

      end

    end

  end
end



