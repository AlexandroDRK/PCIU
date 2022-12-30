class Comentario < ApplicationRecord
    self.table_name = "Comentario"
    #belongs_to :comunicado
    has_and_belongs_to_many :usuarios, join_table: :Comentario_Usuario
end
