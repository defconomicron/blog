# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

Author.destroy Author.all
Article.destroy Article.all

100.times.each do |n|
  author = Author.create(:name => n, :email => n, :password => n)
  article = Article.create(:title => n, :content => n, :author_id => author.id)
end
