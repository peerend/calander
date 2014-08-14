class CreateEvent < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.timestamp :start_date
      t.timestamp :end_date
    end
  end
end
