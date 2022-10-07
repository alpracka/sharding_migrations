class AddValueToLives < ActiveRecord::Migration[7.1]
  def up
    Animal.all.each do |animal|
      animal.lives = SecureRandom.random_number(10)
      animal.save
    end
  end

  def down
  end
end
