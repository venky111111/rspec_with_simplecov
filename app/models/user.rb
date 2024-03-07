class User < ApplicationRecord
    has_many :products
    has_many :reviews

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
