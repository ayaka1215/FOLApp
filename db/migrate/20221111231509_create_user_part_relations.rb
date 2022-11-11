class CreateUserPartRelations < ActiveRecord::Migration[7.0]
  def change
    create_table :user_part_relations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :part, null: false, foreign_key: true

      t.timestamps
    end
  end
end
