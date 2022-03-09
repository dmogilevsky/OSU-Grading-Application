class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |c|
      c.integer :CourseID
      c.text :subject
      c.integer :CourseNumber
      c.text :CourseName
      c.integer :Units
      c.timestamps
    end

    create_table :sections do |s|
      s.integer :SectionID
      s.integer :CourseID
      s.integer :SectionNumber
      s.text :Campus
      s.integer :Year
      s.text :Term
    end
  end
end
