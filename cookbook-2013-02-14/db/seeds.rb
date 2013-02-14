# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Book.delete_all
Recipe.delete_all
Ingredient.delete_all

b1 = Book.create(:name => 'Sinfully Easy Delicious Desserts', :cuisine => 'American', :chef => 'Alice Medrich', :image => 'http://www.finecooking.com/assets/uploads/posts/44533/051118026-03-sinfully-easy-cookbook_xlg_lg.jpg')

r1 = Recipe.create(:name => 'Baked Green Tea Donuts', :course => 'dessert', :instructions => 'http://pdxfoodlove.com/baked-green-tea-donuts/', :serving_size => 12, :prep_time => 45, :image => 'http://pdxfoodlove.com/wp-content/uploads/2013/02/green-tea-donuts.jpg', :book_id => '')
r2 = Recipe.create(:name => 'Bourbon Caramel Peanut Butter Cups', :course => 'dessert', :instructions => 'http://kitchenetteblog.com/2013/02/bourbon-caramel-peanut-butter-cups/', :serving_size => 50, :prep_time => 120, :image => 'http://kitchenetteblog.com/wp-content/uploads/2013/02/IMG_2090.jpg', :book_id => '')
r3 = Recipe.create(:name => 'Red Velvet Crinkle Cookies', :course => 'dessert', :instructions => 'http://www.letsdishrecipes.com/2013/02/red-velvet-crinkle-cookies.html#.UR0FzVpevrA', :serving_size => 24, :prep_time => 75, :image => 'http://images.tastespotting.com/thumbnails/557593.jpg', :book_id => '')
r4 = Recipe.create(:name => 'Deeply Appley Apple Cake', :course => 'dessert', :instructions => 'http://cafefernando.com/deeply-appley-apple-cake/', :serving_size => 12, :prep_time => 90, :image => 'http://cafefernando.com/images/applecinnamon_bundtcakerecipe.jpg', :book_id => '')

i1 = Ingredient.create(:name => 'milk', :measurement => '0.25 cups', :cost => 1.00, :image => 'http://www.todayifoundout.com/wp-content/uploads/2010/10/milk.jpg')
i2 = Ingredient.create(:name => 'matcha powder', :measurement => '1 tbsp', :cost => 0.25, :image => 'http://brainsngames.com/wp-content/uploads/2011/11/matcha-green-tea.jpg')
i3 = Ingredient.create(:name => 'peanut butter', :measurement => '1.75 cups', :cost => 3.45, :image => 'http://3.bp.blogspot.com/_u5YQMXBhVkI/TQe5BElWD-I/AAAAAAAAAKg/M_40rzA8AII/s1600/peanut+butter+jar1011937.jpg')
i4 = Ingredient.create(:name => 'espresso powder', :measurement => '0.5 tsps', :cost => 1.00, :image => 'http://www.kingarthurflour.com/item-img/4447_07_10_2012__17_56_02_456')
i5 = Ingredient.create(:name => 'eggs', :measurement => '2', :cost => 0.50, :image => 'http://i-cdn.apartmenttherapy.com/uimages/kitchen/2008_03_26-EggFreshness.jpg')
i6 = Ingredient.create(:name => 'vanilla', :measurement => '1 tsp', :cost => 0.15, :image => 'http://www.kingarthurflour.com/item-img/1842_12_31_2012__14_41_00_456')
i7 = Ingredient.create(:name => 'apple puree', :measurement => '1.5 cups', :cost => 2.15, :image => 'http://img.foodnetwork.com/FOOD/2011/06/06/FNM-070111-Tyler-Baby-Food-003_s4x3_lg.jpg')
i8 = Ingredient.create(:name => 'sugar', :measurement => '1.5 cups', :cost => 0.85, :image => 'http://www.mynewoldschool.com/wp-content/uploads/2010/02/ttar_white_sugar_h.jpg')

b1.recipes << r1 << r2 << r3 << r4
r1.ingredients << i1 << i2 << i5 << i6 << i8
r2.ingredients << i3 << i4 << i5 << i1 << i8
r3.ingredients << i5 << i6 << i1 << i8
r4.ingredients << i7 << i8 << i5