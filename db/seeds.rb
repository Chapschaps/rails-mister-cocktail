# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all
lemon = Ingredient.create(name: "lemon")
ice = Ingredient.create(name: "ice")
mint_leaves = Ingredient.create(name: "mint leaves")
orange = Ingredient.create(name: "orange")
rhum = Ingredient.create(name: "rhum")
vodka = Ingredient.create(name: "vodka")

spritz = Cocktail.create(name: "spritz")
mojito = Cocktail.create(name: "mojito")
gin_tonic = Cocktail.create(name: "gin tonic")
kir = Cocktail.create(name: "kir")


Dose.create(description: "6cl", ingredient_id: lemon.id, cocktail_id: spritz.id)
Dose.create(description: "6cl", ingredient_id: ice.id, cocktail_id: mojito.id)
Dose.create(description: "12cl", ingredient_id: orange.id, cocktail_id: gin_tonic.id)
Dose.create(description: "6cl", ingredient_id: lemon.id, cocktail_id: kir.id)
Dose.create(description: "6cl", ingredient_id: vodka.id, cocktail_id: mojito.id)
