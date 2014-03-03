class AddColorToQuotes < ActiveRecord::Migration
  def change
    add_column :quotes, :color, :string
  end
end
