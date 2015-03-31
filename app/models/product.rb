class Product < ActiveRecord::Base
  has_many :tasks
end
