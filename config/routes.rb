Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :tags
      resources :daily_reflections
      get 'today_reflection', to: 'daily_reflections#today_reflection'
    end
  end
end
