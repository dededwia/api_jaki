Rails.application.routes.draw do
  
  post 'api/registration/create/byapm' => 'jakis#registrationrawatjalanCIK'
  post 'api/registration/create/onsite' => 'jakis#registrationrawatjalan'
  get 'api/appointment/search' => 'jakis#appointmentsearch'
  put 'api/appointment/cancel' => 'jakis#appointmentcancel'
  post 'api/appointment/create' => 'jakis#appointment'
  get 'api/patient/find/noRM' => 'jakis#get_validasi'
  resources :jakis
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   root to: 'home#index'
end
