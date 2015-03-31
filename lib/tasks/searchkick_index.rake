namespace :searchkick do
  desc 'Reindex all models on all tenants'
  task reindex_tenants: :environment do
    Rails.application.eager_load!
    puts "Hi"
    Account.pluck(:subdomain).each do |schema|
      Apartment::Tenant.switch! schema
      (Searchkick::Reindex.instance_variable_get(:@descendents) || []).each do |model|
        puts "Reindexing #{model.name} on #{schema}"
        Apartment::Tenant.switch! schema
        model.reindex
      end
    end
  end
end