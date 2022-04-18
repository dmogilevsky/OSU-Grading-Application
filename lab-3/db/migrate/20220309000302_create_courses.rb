class CreateCourses < ActiveRecord::Migration[6.1]
  def self.up
    create_table :courses do |c|
      c.text :Subject
      c.integer :CourseNumber
      c.text :CourseName
      c.text :Campus
      c.text :Career
      c.timestamps
    end

    create_table :sections do |s|
      s.integer :course_id
      s.integer :SectionNumber
      s.integer :MaxGraders, :default => 1
      s.text :Term
    end

    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      t.integer :role, default: 0
      t.binary :approved

      # Uncomment below if timestamps were not included in your original model.
      # t.timestamps null: false
    end

    create_table :recommendations do |r|
      r.integer :student_id
      r.integer :instructor_id
      r.text :Recommendation
    end

    create_table :grader_forms do |g|
      g.integer :student_id
      g.text :Form
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_foreign_key :recommendations, :users, column: :student_id, primary_key: :id
    add_foreign_key :recommendations, :users, column: :instructor_id, primary_key: :id
    add_foreign_key :grader_forms, :users, column: :student_id, primary_key: :id
    add_foreign_key :sections, :courses, column: :course_id, primary_key: :id
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end

  def self.down
    drop_table :courses
    drop_table :sections
    drop_table :users
    drop_table :recommendations
    drop_table :grader_forms
  end
end
