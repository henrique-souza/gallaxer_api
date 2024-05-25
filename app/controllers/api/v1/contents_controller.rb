# frozen_string_literal: true

module Api
  module V1
    # Controller class for the Contents
    class ContentsController < ApplicationController
      def create
        @content = Content.new(content_params)
        if @content.save
          render json: @content, status: :created
        else
          render json: @content.errors, status: :unprocessable_entity
        end
      end

      def show
        @content = Content.find(params[:id])
        render json: @content
      end

      def update
        @content = Content.find(params[:id])
        if @content.update(content_params)
          render json: @content
        else
          render json: @content.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @content = Content.find(params[:id])
        @content.destroy
      end

      private

      def content_params
        params.require(:content).permit(:title, :description, :category, :thumbnail_url, :content_url)
      end
    end
  end
end
