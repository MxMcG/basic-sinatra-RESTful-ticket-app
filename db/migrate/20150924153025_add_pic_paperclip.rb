class AddPicPaperclip < ActiveRecord::Migration
  def change
    def self.up
       add_column :tickets, :pic_file_name,    :string
       add_column :tickets, :pic_content_type, :string
       add_column :tickets, :pic_file_size,    :integer
       add_column :tickets, :pic_updated_at,   :datetime
    end

    def self.down
       remove_column :tickets, :pic_file_name
       remove_column :tickets, :pic_content_type
       remove_column :tickets, :pic_file_size
       remove_column :tickets, :pic_updated_at
    end
  end
end