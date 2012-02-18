class CreateLugares < ActiveRecord::Migration
  def change
    create_table :lugares do |t|
      t.string :tipo
      t.string :nome
      t.text :endereco_rua
      t.string :endereco_numero
      t.string :endereco_bairro
      t.string :endereco_cidade
      t.string :endereco_estado

      t.timestamps
    end
  end
end
