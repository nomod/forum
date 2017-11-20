Rails.application.routes.draw do

  namespace 'api' do
    namespace 'v1' do

      root 'main#index'
      resources :posts
      resources :users
      resources :marks

    end
  end

end
