class AddLivesToAnimals < ActiveRecord::Migration[7.0]
  def up
    add_column :animals, :lives, :integer

    # NOTE: This is hanging
    # Animal.all.each do |animal|
    #   animal.lives = SecureRandom.random_number(10)
    #   animal.save
    # end
  end

  def down
    remove_column :animals, :lives
  end
end
