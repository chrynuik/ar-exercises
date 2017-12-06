class Employee < ActiveRecord::Base
  attr_accessor :password

  belongs_to :store
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :hourly_rate,
            numericality: true,
            numericality: {greater_than: 20, less_than: 200}
  validates :store, presence: true
  before_save :rand_password

  private
    def rand_password
      self.password = rand(36**8).to_s(36)
    end

end
