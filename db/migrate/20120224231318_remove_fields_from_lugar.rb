class RemoveFieldsFromLugar < ActiveRecord::Migration
  def up
    remove_column :lugares, :endereco_rua
    remove_column :lugares, :endereco_numero
    remove_column :lugares, :endereco_bairro
    remove_column :lugares, :endereco_cidade
    remove_column :lugares, :endereco_estado
  end

  def down
    add_column :lugares, :endereco_rua, :text
    add_column :lugares, :endereco_numero, :string
    add_column :lugares, :endereco_bairro, :string
    add_column :lugares, :endereco_cidade, :string
    add_column :lugares, :endereco_estado, :string
  end
end
