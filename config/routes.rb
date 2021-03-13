Rails.application.routes.draw do
  root to: "home#index"

  resources :study_items, only: [:show, :new, :create, :edit, :update] do 
    patch 'mark_as_done', on: :member
  end
end
