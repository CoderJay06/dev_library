class User < ApplicationRecord
   has_secure_password
   # has_many Subscriptions
   # has_many Books through: Subscriptions
end
