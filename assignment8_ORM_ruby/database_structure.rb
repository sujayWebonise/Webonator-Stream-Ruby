require 'rubygems'
require 'active_record'

ActiveRecord::Base.establish_connection(
   :adapter =>'sqlite3',
   :database => 'personDatabase.db',
   :host => 'localhost'
)
# People table
ActiveRecord::Schema.define do
  create_table :People do |t|
    t.string :user_type
    t.string :name
    t.string :email
  end
  create_table :Posts do |t|
    t.integer :user_id
    t.string :content
    t.string :discription
  end
  create_table :Accounts do |t|
    t.integer :admin_id
    t.integer :account_no
  end
end
# Person
class People < ActiveRecord::Base
end
# user model
class User < People
  has_many :posts
end
# Admin Model
class Admin < People
  has_many :accounts
end
# Post belongs to
class Post < ActiveRecord::Base
  belongs_to :user
end
# account Belongs to
class Account < ActiveRecord::Base
  belongs_to :admin
end
