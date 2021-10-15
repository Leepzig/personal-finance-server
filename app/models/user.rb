class User < ApplicationRecord
    has_secure_password
    has_many :budgets
    validates_presence_of :first_name, :last_name, :email
    validates_uniqueness_of :email

    def full_name
        first_name + " " + last_name
    end
end
