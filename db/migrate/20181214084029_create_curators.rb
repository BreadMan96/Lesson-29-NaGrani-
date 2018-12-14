class CreateCurators < ActiveRecord::Migration[5.2]
  def change
  	create_table :curators do |t|
		t.text :name
		
		t.timestamps 
	end

	Curators.create :name => 'Vladislav Borodin'
	Curators.create :name => 'Artem Tikhonov'

  end
end

