class ChangeImageToMessage < ActiveRecord::Migration[5.0]
  def up
    change_column :messages, :image, :string
  end

  def down
    change_column :messages, :image, :text
  end
end
