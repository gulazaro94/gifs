class CreateGifLabels < ActiveRecord::Migration[6.0]
  def change
    create_table :gif_labels do |t|
      t.references :gif, null: false, foreign_key: true
      t.string :label
      t.timestamps
    end
  end
end
