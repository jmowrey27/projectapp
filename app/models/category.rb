class Category < ApplicationRecord
    has_many :pages
    has_many :products
end
