class Store < ActiveRecord::Base
  has_many :employees
  validates :name, length: {minimum: 3}
  validates :annual_revenue, :numericality => {greater_than_or_equal_to: 0}
  validate :must_have_one_of_mens_women

  def must_have_one_of_mens_women
    if (!mens_apparel) && (!womens_apparel)
      errors.add :mens_apparel, "and womens apparel can't both be false"
      # errors.add(:womens_apparel, "can't both be false")
    end
  end
end
