class CreateCourses < ActiveRecord::Migration[6.1]
  def self.up
    create_table :course do |c|
      c.integer :CourseID
      c.text :subject
      c.integer :CourseNumber
      c.text :CourseName
      c.integer :Units
      c.timestamps
    end

    create_table :section do |s|
      s.integer :SectionID
      s.references :course, foreign_key: true
      s.integer :SectionNumber
      s.text :Campus
      s.integer :Year
      s.text :Term
    end
  end

  def self.down
    drop_table :course
    drop_table :section
  end
end
