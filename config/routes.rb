Rails.application.routes.draw do
  devise_for :employees

  root 'static_pages#home'
  get 'help', to: 'static_pages#help'
  get 'statistics', to: 'static_pages#statistics'

  resources :roles

  resources :employees do
    post :activate
    resources :medical_records, :events, :phones, :addresses,
              :dependants, :next_of_kins, :medical_records,
              :reports, :notes, :qualifications, :competencies,
              :responsibilities, :trade_careers, :assignments,
              :promotion_dates, :suggestions, :announcements
  end
end
