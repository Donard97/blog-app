class CreateJwtDenylist < ActiveRecord::Migration[6.1]
  def change
    create_table :jwt_denylists do |t|
      create_table :jwt_denylist do |t|
        t.string :jti, null: false
        t.datetime :exp, null: false
      end
      add_index :jwt_denylist, :jti
      
      t.timestamps
    end
  end
end
