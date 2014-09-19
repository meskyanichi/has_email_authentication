module HasEmailAuthentication
  require "has_email_authentication/module"
  require "has_email_authentication/version"
end

if defined?(ActiveRecord::Base)
  ActiveRecord::Base.send(:include, HasEmailAuthentication::Module)
end
