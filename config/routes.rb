# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, only: %i[create show update destroy]
  resources :contents, only: %i[create show update destroy]
  resources :ratings, only: [:create]
end
