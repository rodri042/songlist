WebApp::Application.routes.draw do
	mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
	
	scope "api", defaults: {format: :json} do
		post "login", to: "users#login"
		#post "users", to: "users#register"
		#put "users", to: "users#change_password"

		get "songs", to: "songs#index"
		get "songs/:id", to: "songs#get"
		post "songs", to: "songs#create"
		put "songs/:id", to: "songs#update"
		delete "songs/:id", to: "songs#delete"
	end

	get "language", to: "language#get"

	root 'home#index'
end