class CreateBbCodeTags < ActiveRecord::Migration
  def change
    create_table :bb_code_tags do |t|
      t.string :name
      t.boolean :custom
      t.text :regexp
      t.text :replacement
      t.text :description
      t.text :example
      t.string :enable_symbol
      t.boolean :enabled

      t.timestamps
    end
  end
end
