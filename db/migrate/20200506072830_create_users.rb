class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name #userテーブルのnameカラム
      t.string :email # emailカラム

      t.timestamps #created_at,updated_atがこれで生成
    end
  end
end
