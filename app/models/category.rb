class Category < ApplicationRecord

  def category_view
    connection = ActiveRecord::Base.connection
    connection.execute <<-SQL
    CREATE VIEW "category_view" AS SELECT "categories".name as category_name, "dishes".name as dish_name, "recipes".name as recipe_name, "recipes".instructions, "recipes".photo_recipe FROM "categories" LEFT OUTER JOIN "dishes" ON "categories".id = "dishes".category_id LEFT OUTER JOIN "recipes" ON "dishes".id = "recipes".dish_id;
    SQL

    result = connection.execute <<-SQL
    SELECT * FROM "category_view";
    SQL
    
    connection.execute <<-SQL
    DROP VIEW "category_view";
    SQL
    
    result = JSON.parse(result.to_json)
    return result
  end
  
  def all_categories
    connection = ActiveRecord::Base.connection
    result = connection.execute <<-SQL 
    SELECT * FROM "categories";
    SQL
    result = JSON.parse(result.to_json)
    @categories = []
    result.each do |category|
      @categories.push(Category.new(id: category["id"], name: category["name"]))
    end
    return @categories
  end
  
  def create_category
    connection = ActiveRecord::Base.connection
    connection.execute <<-SQL 
    INSERT INTO "categories" (name) VALUES ('#{self.name}');
    SQL
    return true
  end

  def find_category(id)
    connection = ActiveRecord::Base.connection
    result = connection.execute <<-SQL 
    SELECT * FROM "categories" WHERE id = '#{id}';
    SQL
    result = JSON.parse(result.to_json)[0]
    return Category.new(id: result["id"], name: result["name"])
  end

  def update_category(name, id)
    connection = ActiveRecord::Base.connection
    connection.execute <<-SQL
    UPDATE "categories" SET name = '#{name}' WHERE id = '#{id}';
    SQL
  end

  def delete_category(id)
    connection = ActiveRecord::Base.connection
    connection.execute <<-SQL
    DELETE FROM "categories" WHERE id = '#{id}';
    SQL
  end

end
