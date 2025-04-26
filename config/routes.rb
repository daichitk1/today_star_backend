Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :tags
      resources :daily_reflections
    end
  end
end
