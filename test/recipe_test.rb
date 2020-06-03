require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'

class RecipeTest < Minitest::Test
  def setup
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @recipe1 = Recipe.new("Mac and Cheese")
  end

  def test_it_exists
    assert_instance_of Recipe, @recipe1
  end

  def test_it_has_attributes
    assert_equal "Mac and Cheese", @recipe1.name
    assert_equal ({}), @recipe1.ingredients_required
  end

  def test_it_can_add_ingredients
    assert_equal ({}), @recipe1.ingredients_required
    @recipe1.add_ingredient(@ingredient1, 2)
    assert_equal ({@ingredient1 => 2}), @recipe1.ingredients_required
    @recipe1.add_ingredient(@ingredient1, 4)
    assert_equal ({@ingredient1 => 6}), @recipe1.ingredients_required
    @recipe1.add_ingredient(@ingredient2, 8)
    assert_equal ({@ingredient1 => 6, @ingredient2 => 8}), @recipe1.ingredients_required
  end

  def test_it_can_list_only_ingredients
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient1, 4)
    @recipe1.add_ingredient(@ingredient2, 8)
    assert_equal [@ingredient1, @ingredient2], @recipe1.ingredients
  end
end
