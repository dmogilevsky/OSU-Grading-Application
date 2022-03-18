class CreateCourses < ActiveRecord::Migration[6.1]
  def self.up
    create_table :courses do |c|
      c.integer :CourseID
      c.text :Subject
      c.integer :CourseNumber
      c.text :CourseName
      c.integer :Units
      c.timestamps
    end

    create_table :sections do |s|
      s.integer :SectionID
      s.references :courses, foreign_key: true
      s.integer :SectionNumber
      s.text :Campus
      s.integer :Year
      s.text :Term
    end
  end

  def self.down
    drop_table :courses
    drop_table :sections
  end
end
