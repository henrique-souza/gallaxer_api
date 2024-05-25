# frozen_string_literal: true

module Api
  module V1
    # Controller class for the Ratings
    class RatingsController < ApplicationController
      def create
        @rating = Rating.new(rating_params)
        if @rating.save
          render json: @rating, status: :created
        else
          render json: @rating.errors, status: :unprocessable_entity
        end
      end

      private

      def rating_params
        params.require(:rating).permit(:user_id, :content_id, :stars)
      end
    end
  end
end
