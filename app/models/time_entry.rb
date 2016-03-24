class TimeEntry < ActiveRecord::Base
  belongs_to :developers
  validates :duration, presence: true
  validates :developer_id, presence: true
  validates :date_on, presence: true
end
