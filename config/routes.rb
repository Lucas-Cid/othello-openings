Rails.application.routes.draw do
	get 'openings/importOpeningFile', to: 'openings#importOpeningFile'

	get 'openings/showUserOpenings', to: 'openings#showUserOpenings'

	get 'users/emailConfirmation', to: 'users#emailConfirmation'

	resources :openings

	resources :users do
  		member do
    		get 'openings'
  		end
	end

	resources :configurations
end
