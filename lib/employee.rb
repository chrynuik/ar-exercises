class Employee < ActiveRecord::Base
  belongs_to :store
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :hourly_rate,
            numericality: true,
            numericality: {greater_than: 20, less_than: 200}
  validates :store, presence: true
end
