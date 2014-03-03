class AddTemplateToQuotes < ActiveRecord::Migration
  def change
    add_column :quotes, :template, :string
  end
end
