class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    @recipes.flat_map do |recipe|
      recipe.ingredients.flat_map {|ingredient| ingredient.name}
    end.uniq
  end

  def higest_calorie_meal
    @recipes.max_by do |recipe|
      recipe.total_calories
    end
  end
end
