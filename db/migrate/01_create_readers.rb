class CreateReaders < ActiveRecord::Migration[4.2]

  def change
    create_table :readers do |t|
      t.string :name
    end
  end

end
