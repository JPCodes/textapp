class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :to
      t.string :from
      t.text :body
      
    end
  end
end
