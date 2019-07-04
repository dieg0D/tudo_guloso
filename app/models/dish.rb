class Dish < ApplicationRecord
  def all_dishes
    connection = ActiveRecord::Base.connection
    result = connection.execute <<-SQL 
    SELECT * FROM "dishes";
    SQL
    result = JSON.parse(result.to_json)
    @dishes = []
    result.each do |dish|
      @dishes.push(Dish.new(id: dish["id"], name: dish["name"]))
    end
    return @dishes
  end
  
  def create_dish
    connection = ActiveRecord::Base.connection
    connection.execute <<-SQL 
    INSERT INTO "dishes" (name, category_id) VALUES ('#{self.name}', '#{self.category_id}');
    SQL
    return true
  end

  def find_dish(id)
    connection = ActiveRecord::Base.connection
    result = connection.execute <<-SQL 
    SELECT * FROM "dishes" WHERE id = '#{id}';
    SQL
    result = JSON.parse(result.to_json)[0]
    return Dish.new(id: result["id"], name: result["name"])
  end

  def update_dish(name, category_id, id)
    connection = ActiveRecord::Base.connection
    connection.execute <<-SQL
    UPDATE "dishes" SET name = '#{name}' , category_id = '#{category_id}' WHERE id = '#{id}';
    SQL
  end

  def delete_dish(id)
    connection = ActiveRecord::Base.connection
    connection.execute <<-SQL
    DELETE FROM "dishes" WHERE id = '#{id}';
    SQL
  end
end
