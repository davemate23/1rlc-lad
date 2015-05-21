Rails.application.routes.draw do
  devise_for :employees

  root 'static_pages#home'
  get 'help', to: 'static_pages#help'

  resources :roles

  resources :employees do
    resources :medical_records, :events, :phones, :addresses,
              :spouses, :next_of_kins, :medical_records,
              :reports, :notes, :qualifications, :competencies,
              :responsibilities, :trade_careers, :assignments
  end
end
