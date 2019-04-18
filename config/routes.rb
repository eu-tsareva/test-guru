Rails.application.routes.draw do
  root 'quizzes#index'

  devise_for :users,
    path: :gurus,
    path_names: { sign_in: :login, sign_out: :logout },
    controllers: { sessions: :sessions, registrations: :registrations }

  resources :quizzes, only: :index do
    post 'start', on: :member
  end

  resources :quiz_passages, only: %i[show update] do
    get 'result', on: :member
  end

  namespace :admin do
    resources :quizzes do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
