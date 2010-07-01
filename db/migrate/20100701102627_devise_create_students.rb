class DeviseCreateStudents < ActiveRecord::Migration
  def self.up
    create_table(:students) do |t|
      t.database_authenticatable :null => false
      # t.confirmable
      t.recoverable
      t.rememberable
      t.trackable
      # t.lockable

      t.string :name
      t.string :phone
      t.string :rg
      t.string :cpf, :null => false
      t.date :birthdate
      t.string :birthplace
      t.string :marital_status
      t.references :address

      t.timestamps
    end

    # add_index :students, :email,                :unique => true
    # add_index :students, :confirmation_token,   :unique => true
    add_index :students, :reset_password_token, :unique => true
    # add_index :students, :unlock_token,         :unique => true
  end

  def self.down
    drop_table :students
  end
end

