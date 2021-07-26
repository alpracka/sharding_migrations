class AddLivesToAnimals < ActiveRecord::Migration[6.1]
  def change
    add_column :animals, :lives, :integer

    reversible do |dir|
      dir.up do
        Animal.reset_column_information
        Animal.all.each do |animal|
          animal.lives = SecureRandom.random_number(10)
          animal.save
        end
      end

      dir.down do
        # nothing
      end
    end
  end
end
