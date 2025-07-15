class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validações
  validates :role, presence: true, inclusion: { in: %w[admin editor] }

  # Métodos de conveniência
  def admin?
    role == 'admin'
  end

  def editor?
    role == 'editor'
  end
end
