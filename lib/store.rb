class Store < ActiveRecord::Base
  has_many :employees
  validates :name,
            presence: true,
            length: {minimum: 3}
  validates :annual_revenue,
            numericality: true,
            numericality: {greater_than_or_equal_to: 0}

  before_destroy :store_destroy_check

  private
    def store_destroy_check
      unless employees.empty?
        errors.add(
          :base,
          message: "store has employees cannot delete"
        )

        throw(:abort)
      end
    end
end