Rails.application.routes.draw do
  api_guard_routes for: 'users'
  resources :properties
  resources :bookings
end
