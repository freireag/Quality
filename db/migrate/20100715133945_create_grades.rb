class CreateGrades < ActiveRecord::Migration
  def self.up
    create_table :grades do |t|
      t.references :student
      t.references :exam
      t.float :grade

      t.timestamps
    end
  end

  def self.down
    drop_table :grades
  end
end
