desc "Remove searches older than a month"
task :remove_old_searches => :environment do
  Account.all.each do |acct|
    Apartment::Tenant.switch!(acct.subdomain)
    Search.delete_all ["created_at < ?", 30.minutes.ago]
  end
end
