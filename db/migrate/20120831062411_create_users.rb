class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :fullname
      t.string :gender
      t.date   :dob
      t.string :email
      t.string :password_digest
      t.string :remember_token
      #t.integer :posts_count
      #t.integer :comments_count
      #t.integer :likes_count

      t.timestamps
    end
  end
end
