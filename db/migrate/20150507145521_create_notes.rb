class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.text :body_text
      t.text :body_html
      t.references :user, index: true
      t.timestamps
    end
  end
end
