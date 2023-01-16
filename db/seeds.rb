# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Usuario.create([
    {matricula: 1, email: 'prof@pciu.br', nome: 'Professor', tipo: 'Professor', password: 'senhasenha'},
    {matricula: 2, email: 'aluno@pciu.br', nome: 'Aluno', tipo: 'Aluno', password: 'senhasenha'}
    ])

Curso.create(id: 1, nome: 'Ciência da Computação')
t = Turma.create([{id: 11, nome: 'Bloco 06', curso_id: 1, periodo: '2022.1'}, {id: 12, nome: 'Bloco 08', curso_id: 1, periodo: '2022.1'}])

u = Usuario.first
u.turmas << t

u = Usuario.last
t = Turma.first
u.turmas << t