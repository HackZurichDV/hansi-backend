# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :lists
    get "/autocomplete" => "autocomplete#index"
  end
end
