class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :available

      t.timestamps
    end
  end
end
