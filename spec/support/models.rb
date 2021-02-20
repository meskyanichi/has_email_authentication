class User < ActiveRecord::Base
  has_email_authentication
end

class UserCustom < ActiveRecord::Base
  has_email_authentication :uniqueness => { :message => "has already been taken" }
end
