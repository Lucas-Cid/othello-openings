Rails.application.routes.draw do
	get 'openings/importOpeningFile', to: 'openings#importOpeningFile'
	resources :openings, :users, :configurations
end
