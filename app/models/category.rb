class Category < ApplicationRecord

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
