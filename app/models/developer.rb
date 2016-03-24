class Developer < ActiveRecord::Base
  has_many :time_entries
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
