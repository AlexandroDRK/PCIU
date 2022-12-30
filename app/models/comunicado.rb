class Comunicado < ApplicationRecord
  self.table_name = "Comunicado"

  # associations:
  belongs_to :turma, class_name: "Turma"
  #belongs_to :curso, class_name: "Curso"
  belongs_to :autor, class_name: "Usuario"
  has_many :comentarios

  # validations:
  validates :turma_id, presence: {message: "precisa ser preenchido."}
  validates :titulo, presence: {message: "precisa ser preenchido."}
  validates :corpo, presence: {message: "precisa ser preenchido."}
end
