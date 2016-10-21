class CreateTargets < ActiveRecord::Migration[5.0]
  def change
    create_table :targets do |t|
      t.belongs_to :list, foreign_key: true
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
