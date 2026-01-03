defmodule Diet.DietsFactory do
  defmacro __using__(_) do
    quote do
      def food_factory() do
        %Diet.Diets.Food{
          name: sequence("Food"),
          proteins: sequence(:proteins, &Decimal.new("#{&1}"), start_at: 10.0),
          fats: sequence(:fats, &Decimal.new("#{&1}"), start_at: 30.0),
          carbohydrates: sequence(:carbohydrates, &Decimal.new("#{&1}"), start_at: 50.0)
        }
      end
    end
  end
end
