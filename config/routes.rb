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
    resources :users, only: [:index, :update, :edit, :destroy]
    resources :tasks do
      collection do
        get 'search'
        get 'due_now'
      end
    end
    
    get 'tasks/filters/status/:status_id' => 'tasks#index'
    get 'tasks/filters/priority/:priority_id' => 'tasks#index'
    get 'tasks/filters/product/:product_id' => 'tasks#index'
    get 'tasks/filters/all/:all_tasks' => 'tasks#index'
    
    resources :tasks do
      resources :task_details
    end
    
    resources :clients do
      resources :client_contacts
      collection do
        post :sort
        get 'contacts'
      end
    end

    resources :statuses do
      collection { post :sort }
    end
    
    resources :priorities do
      collection { post :sort }
    end

    resources :products do
      collection { post :sort }
    end
    
    resources :projects do
      resources :tasks
    end

    resources :searches

    resources :todo_lists do
      resources :todo_items do
        member do
          patch :complete
        end
      end
    end
    
    get 'analytics/show'
    
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
