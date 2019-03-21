Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :quizzes do
    resources :questions, shallow: true
  end
end
