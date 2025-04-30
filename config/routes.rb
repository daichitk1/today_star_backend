Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :tags
      resources :daily_reflections
      post 'today_reflection', to: 'daily_reflections#today_reflection'
      post 'all_reflections', to: 'daily_reflections#all_reflections'
    end
  end
end
