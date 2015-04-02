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
  constraints(SubdomainPresent) do
    root 'tasks#index', as: :subdomain_root
    devise_for :users
    resources :users, only: :index
    resources :tasks do
      collection do
        get 'search'
      end
    end
    resources :tasks do
      resources :task_details
    end
    resources :clients
    resources :statuses
    resources :priorities
    resources :products
    get 'pages/index'
    resources :billings, only: [:new, :show, :create]
    get 'tags/:tag', to: 'tasks#index', as: :tag
  end

  constraints(SubdomainBlank) do
    root 'welcome#index'
    resources :accounts, only: [:new, :create]
  end
end