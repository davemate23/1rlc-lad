Rails.application.routes.draw do
  devise_for :employees

  root 'static_pages#home'
  get 'help', to: 'static_pages#help'

  resources :roles

  resources :employees do
    resources :medical_records, :events, :phones, :addresses,
              :dependants, :next_of_kins, :medical_records,
              :reports, :notes, :qualifications, :competencies,
              :responsibilities, :trade_careers, :assignments,
              :promotion_dates
  end
end
