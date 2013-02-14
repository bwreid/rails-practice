# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Author.delete_all
Book.delete_all

Author.create( :name => 'David Levithan', :dob => '1972/09/07', :image => 'http://www.doylestownbookshop.com/files/doylestown/54093_levithan_david.jpg' )
Book.create( :title => 'The Lover\'s Dictionary', :genre => 'Young Adult', :favorite => false, :image => 'http://www.newyorker.com/online/blogs/books/assets_c/2011/02/1the-lovers-dictionary-thumb-300x448-62746.jpg' )
Book.create( :title => 'The Realm of Possibility', :genre => 'Young Adult', :favorite => false, :image => 'http://yaloveblog.com/wp-content/uploads/2010/12/the-realm-of-possibility1.jpg' )

Author.create( :name => 'George R. R. Martin', :dob => '1948/09/20', :image => 'http://cdn1.screenrant.com/wp-content/uploads/George-RR-Martin-HBO-Deal.jpg' )
Book.create( :title => 'A Storm of Swords', :genre => 'Fantasy', :favorite => false, :image => 'http://www.audioeditions.com/audio-book-images/l/A-Storm-of-Swords-2783575.jpg' )

Author.create( :name => 'J.K. Rowling', :dob => '1965/07/31', :image => 'http://www.biography.com/imported/images/Biography/Images/Profiles/R/JK-Rowling-40998-1-402.jpg' )
Book.create( :title => 'The Casual Vacancy', :genre => 'Fiction', :favorite => false, :image => 'http://www.digitalbookworld.com/wp-content/uploads/the-casual-vacancy-jk-rowling.jpg' )
Book.create( :title => 'Harry Potter and the Sorcerer\'s Stone', :genre => 'Young Adult', :favorite => false, :image => 'http://4.bp.blogspot.com/-p06rdWqAL5I/UHhaI5P8aPI/AAAAAAAAAqU/9lWJKjoPwgw/s1600/harry-potter-1.jpg' )