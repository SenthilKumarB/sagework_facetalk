Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, "293877427293863", "3edcae9265495fd7e4195db07746767a",
						{:client_options => {:ssl => {:verify => false}}}  # Modify this with your SSL certificates path 
	provider :twitter, "hGCw9N4u0AB3j4vEjMN6Dg", "hJEuhvVtIXKPEdeJgNfLxMGKQE1D4pjgbr8hRVjV4"

end