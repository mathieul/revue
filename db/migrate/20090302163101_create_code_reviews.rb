class CreateCodeReviews < ActiveRecord::Migration
  def self.up
    create_table :code_reviews do |t|
      t.string :title,      :null => false, :limit => 200
      t.integer :owner_id,  :null => false
      t.string :state,      :null => false, :default => 'passive'
      t.datetime :due_at

      t.timestamps
    end
  end

  def self.down
    drop_table :code_reviews
  end
end
