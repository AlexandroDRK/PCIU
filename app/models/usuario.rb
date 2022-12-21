class Usuario < ApplicationRecord
<<<<<<< HEAD
    self.table_name = "Usuário"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, authentication_keys: [:email ]
=======
    self.table_name = "Usuario"
    self.primary_key = :matricula
>>>>>>> f9ab40b (Comunicados branch)
end
