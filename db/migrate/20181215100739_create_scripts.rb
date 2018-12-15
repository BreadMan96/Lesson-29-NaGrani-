class CreateScripts < ActiveRecord::Migration[5.2]
  def change

  	create_table :scripts do |t|
		t.text :email
		t.text :name
		t.text :content
		
		t.timestamps 
	end

  end
end
