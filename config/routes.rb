Bikeshare::Application.routes.draw do
  get "pages/index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#index'

  get "/index", :to => "pages#index"
end
