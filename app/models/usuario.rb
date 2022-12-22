class Usuario < ApplicationRecord
  self.table_name = "Usuario"
  self.primary_key = :matricula

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
  :recoverable, :rememberable, :validatable, authentication_keys: [:email ]
end
