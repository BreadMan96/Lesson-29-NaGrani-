class CreateActors < ActiveRecord::Migration[5.2]
  def change

  	create_table :actors do |t|
		t.text :name
		t.text :age
		t.text :phone
		t.text :city
		t.text :link
		t.text :role
		
		t.timestamps 
	end
	
  end

end
