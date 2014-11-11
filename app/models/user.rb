class User < ActiveRecord::Base
  belongs_to :tipodoc
  belongs_to :cargo

  authenticates_with_sorcery!

  validates :password, length: { minimum: 8 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true
end
