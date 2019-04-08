Rails.application.routes.draw do
  get 'sessions/new'
  root 'quizzes#index'

  resources :quizzes do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end
    post 'start', on: :member
  end

  resources :quiz_passages, only: %i[show update] do
    get 'result', on: :member
  end

  resources :users, only: :create
  get :signup, to: 'users#new'

  resources :sessions, only: :create
  get :login, to: 'sessions#new'
  delete :logout, to: 'sessions#destroy'
end
