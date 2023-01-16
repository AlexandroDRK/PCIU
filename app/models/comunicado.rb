class Comunicado < ApplicationRecord
  self.table_name = "Comunicado"

  # associations:
  has_and_belongs_to_many :turma, join_table: :Turma_Comunicado
  belongs_to :autor, class_name: "Usuario"
  has_many :comentarios

  # validations:
  validates_associated :turma
  validates :titulo, presence: {message: "precisa ser preenchido."}
  validates :corpo, presence: {message: "precisa ser preenchido."}
end
