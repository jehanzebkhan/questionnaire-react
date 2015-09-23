class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :label
      t.boolean :disabled

      t.timestamps null: false
    end
  end
end
