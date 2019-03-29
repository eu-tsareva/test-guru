Rails.application.routes.draw do
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
end
