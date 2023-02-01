# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Usuario.create([
    {matricula: 1, email: 'alexandro@pciu.br', nome: 'Alexandro Alves', tipo: 'Professor', password: 'senhasenha'},
    {matricula: 2, email: 'jose@pciu.br', nome: 'José Wesley', tipo: 'Aluno', password: 'senhasenha'},
    {matricula: 3, email: 'blenda@pciu.br', nome: 'Blenda Costa', tipo: 'Aluno', password: 'senhasenha'},
    {matricula: 4, email: 'anderson@pciu.br', nome: 'Anderson Marcos', tipo: 'Aluno', password: 'senhasenha'},
    ])

Curso.create(id: 1, nome: 'Ciência da Computação')

turmas = Turma.create([{id: 11, nome: 'Banco de Dados II', curso_id: 1, periodo: '2022.1'}, {id: 12, nome: 'Engenharia de Software II', curso_id: 1, periodo: '2022.1'}, {id: 13, nome: 'Matemática Discreta', curso_id: 1, periodo: '2022.1'}, {id: 14, nome: 'Redes de Computadores I', curso_id: 1, periodo: '2022.1'}, {id: 15, nome: 'Direito', curso_id: 1, periodo: '2022.1'}, {id: 16, nome: 'Inteligência Artificial', curso_id: 1, periodo: '2022.1'}, {id: 17, nome: 'Ling. Formais e Autômatos', curso_id: 1, periodo: '2022.1'}])

u = Usuario.first
u.turmas << turmas

t = Turma.find([11, 12, 14, 15, 16, 17])

u = Usuario.find(2)
u.turmas << t
u = Usuario.find(3)
u.turmas << t
u = Usuario.find(4)
u.turmas << t


t = Turma.find(13)

u = Usuario.find(3)
u.turmas << t
u = Usuario.find(4)
u.turmas << t