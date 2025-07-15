class Category < ApplicationRecord
  # Associações
  has_many :products, dependent: :destroy

  # Validações
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  # Scopes
  scope :with_active_products, -> { joins(:products).where(products: { active: true }).distinct }
end
