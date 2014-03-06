class AddStuffToQuotes < ActiveRecord::Migration
  def change
    add_column :quotes, :font_size, :string
    add_column :quotes, :font, :string
    add_column :quotes, :alignment, :string
  end
end
