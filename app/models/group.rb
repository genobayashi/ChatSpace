class Group < ApplicationRecord
  has_many :messages
  has_many :user_groups
  has_many :users, through: :user_groups
  accepts_nested_attributes_for :users

  validates :name, presence: true
end
