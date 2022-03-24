Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'admin_page', to: 'admin_page#index', as: 'admin_page' # index
  get 'student_page', to: 'student_page#index', as: 'student_page' # index

end

