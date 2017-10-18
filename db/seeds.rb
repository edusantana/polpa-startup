# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

lote = Lote.create({data: Time.now, ativo: true})

pmaracuja = Produto.create({nome: "Polpa de Maracujá (1kg)", quantidade: 25, valor: 12.0, lote_id: lote.id})
pmaracuja = Produto.create({nome: "Polpa de Morango (1kg)", quantidade: 20, valor: 14.0, lote_id: lote.id})

