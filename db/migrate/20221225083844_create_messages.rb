class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :message
      t.references :user, null: false, foreign_key: true
      t.references :topic, null: false, foreign_key: true
      t.timestamps
    end
  end
end
