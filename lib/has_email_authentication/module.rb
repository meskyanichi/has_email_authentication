module HasEmailAuthentication::Module

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods

    # Generates the +find_by_email+ class method. Downcases the +:email+
    # attribute before saving. Validates the presence, format and uniqueness
    # of the +:email+ attribute.
    #
    # @example
    #
    #   class User < ActiveRecord::Base
    #     has_email_authentication
    #   end
    #
    #   User.create(email: "MICHAEL@example.com")
    #   User.find_by_email("michael@EXAMPLE.com)
    #
    def has_email_authentication(options = {})
      validation_options = {
        :presence   => true,
        :format     => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
        :uniqueness => { :case_sensitive => false,
                         :message        => "is unavailable" }
      }

      validates :email, validation_options.deep_merge(options)

      before_save { self.email = email.try(:downcase) }

      extend(FindByEmail)
    end
  end

  module FindByEmail

    # Convenience method for finding a record by email. Attempts
    # to downcase the provided +email+ prior to searching the database for it.
    #
    # @param email [String] the email to find the record by.
    # @return [Object, nil]
    #
    def find_by_email(email)
      find_by(email: email.try(:downcase))
    end
  end
end
