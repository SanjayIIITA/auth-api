class Company < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :address, :establish_year, presence: true
end
