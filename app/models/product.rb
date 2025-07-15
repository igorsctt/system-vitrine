class Product < ApplicationRecord
  belongs_to :category
  has_one_attached :main_image

  # Validações
  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :active, inclusion: { in: [true, false] }

  # Scopes
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :by_category, ->(category) { where(category: category) }

  # Callbacks
  before_validation :set_active_default

  private

  def set_active_default
    self.active = true if active.nil?
  end
end
