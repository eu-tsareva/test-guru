Rails.application.routes.draw do
  root 'quizzes#index'

  resources :quizzes do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end
  end
end
