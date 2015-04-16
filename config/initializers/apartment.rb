Apartment.configure do |config|
  config.excluded_models = ['Account', 'Color', 'Role']
  config.tenant_names = lambda{ Account.pluck(:subdomain) }
end