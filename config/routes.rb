class SubdomainPresent
  def self.matches?(request)
    request.subdomain.present?
  end
end

class SubdomainBlank
  def self.matches?(request)
    request.subdomain.blank?
  end
end

Rails.application.routes.draw do
  get 'analytics/show'

  constraints(SubdomainPresent) do
    root 'tasks#index', as: :subdomain_root
    devise_for :users
    resources :users, only: [:index, :update, :edit, :destroy]
    resources :tasks do
      collection do
        get 'search'
      end
    end
    get 'tasks/filters/status/:status_id' => 'tasks#index'
    get 'tasks/filters/priority/:priority_id' => 'tasks#index'
    get 'tasks/filters/product/:product_id' => 'tasks#index'
    get 'tasks/filters/all/:all_tasks' => 'tasks#index'
    resources :tasks do
      resources :task_details
    end
    resources :clients
    resources :statuses do
      collection { post :sort }
    end
    resources :priorities
    resources :products do
      collection { post :sort }
    end
    resources :projects do
      resources :tasks
    end
    get 'pages/index'
    resources :billings, only: [:new, :show, :create]
    get 'tags/:tag', to: 'tasks#index', as: :tag
    get 'welcome/documentation' => 'welcome#documentation'
  end

  constraints(SubdomainBlank) do
    root 'welcome#index'
    resources :accounts, only: [:new, :create]
    get 'pages/test' => 'pages#test'
    get 'welcome/index' => 'welcome#index'
    get 'welcome/test' => 'welcome#test'
  end
end