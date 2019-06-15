class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text       :messages
      t.references :user, foreign_key: true
      t.timestamps null: true
    end
  end
end
