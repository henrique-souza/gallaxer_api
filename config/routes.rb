# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[index create show update destroy]
      resources :contents, only: %i[create show update destroy]
      resources :ratings, only: [:create]
    end
  end
end
