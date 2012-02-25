class AddEnderecoToLugar < ActiveRecord::Migration
  def change
    add_column :lugares, :endereco, :text
  end
end
