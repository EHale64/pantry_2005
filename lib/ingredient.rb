class Ingredient
  attr_reader :name, :unit, :calories

  def initialize(ingredient_params)
    @name = ingredient_params[:name]
    @unit = ingredient_params[:unit]
    @calories = ingredient_params[:calories]
  end
end
