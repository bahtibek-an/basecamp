class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.references :user, null: false, foreign_key: true
      t.references :project_id, null: false, foreign_key: true
      t.boolean :is_admin
      t.timestamps
    end
  end
end
