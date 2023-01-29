class Usuario < ApplicationRecord
  self.table_name = "Usuario"
  self.primary_key = :matricula

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable, :recoverable, authentication_keys: [:email ]

  #associations:
  has_many :comunicados
  has_and_belongs_to_many :turmas, join_table: :Turma_Usuario
  has_many :comentarios
end
