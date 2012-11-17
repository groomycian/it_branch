class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :surname
      t.string :patronymic
      t.string :email
      t.date :birthdate
      t.integer :degree
      t.integer :position
      t.integer :status
      t.integer :seniority

      t.timestamps
    end
  end
end
