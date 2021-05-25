class CreateKittens < ActiveRecord::Migration[6.1]
  def change
    create_table :kittens do |t|

      t.timestamps
    end
  end
end
