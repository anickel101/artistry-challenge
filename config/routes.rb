Rails.application.routes.draw do
  
    resources :instruments
    resources :artists
    resources :artist_instruments

    
end
