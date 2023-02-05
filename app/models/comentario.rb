class Comentario < ApplicationRecord
    self.table_name = "Comentario"
    belongs_to :comunicado
    belongs_to :usuario

    validates :corpo, presence: {message: "precisa ser preenchido."}
end
