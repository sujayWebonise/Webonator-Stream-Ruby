require './database_structure.rb'
# database contents
class DatabaseContents
  def input_data
    admin_one = Admin.create(
                            name: 'sujay',
                            email: 'sujay.gavhane@gmail.com',
                            user_type: 'Admin'
                           )
    admin_two = Admin.create(
                           name: 'deepak',
                           email: 'sujay.gavhane@gmail.com',
                           user_type: 'Admin'
                           )
    user_one = User.create(
                           name: 'divya',
                           email: 'sujay.gavhane@gmail.com',
                           user_type: 'User'
                         )
    user_two = User.create(
                           name: 'ashwini',
                           email: 'sujay.gavhane@gmail.com',
                           user_type: 'User'
                         )

    post_one = Post.new(content: 'hello', discription: 'greet')
    post_one.user = user_one
    post_one.save

    post_two = Post.new(content: 'hi', discription: 'welcome')
    post_two.user = user_two
    post_two.save

    account_one = Account.new(account_no: '11111111')
    account_one.admin = admin_one
    account_one.save

    account_two = Account.new(account_no: '2222222')
    account_two.admin = admin_two
    account_two.save
  end
end
