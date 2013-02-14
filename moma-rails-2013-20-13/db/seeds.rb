# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Artist.delete_all
Painting.delete_all

Artist.create(:name => 'Andy Warhol', :nationality => 'American', :dob => '1928/8/6', :period => 'Pop Art', :image => 'http://www.andywarhol.net/images/Andy-Warhol.jpg')
Painting.create(:title => 'Querelle', :year => '1982', :style => 'Pop Art', :image => 'http://www.londonprintfair.com/items/10154.jpg')

Artist.create(:name => 'Pablo Picasso', :nationality => 'Spanish', :dob => '1881/10/25', :period => 'Cubism', :image => 'http://www.biography.com/imported/images/Biography/Images/Profiles/P/Pablo-Picasso-9440021-1-402.jpg')
Painting.create(:title => 'Les Demoiselles d\'Avignon', :year => '1907', :style => 'Cubism', :image => 'http://media.timeout.com/images/resizeBestFit/100226813/660/370/image.jpg')

Artist.create(:name => 'Jasper Johns', :nationality => 'American', :dob => '1930/5/15', :period => 'Abstract Expressionism', :image => 'http://www.nga.gov/feature/artnation/johns/images/johns/johns_portrait_380x311.jpg')
Painting.create(:title => 'Flag', :year => '1954', :style => 'Abstract Expressionism', :image => 'http://edu.warhol.org/images/jasper-johns-flag.jpg')

Artist.create(:name => 'Roy Lichtenstein', :nationality => 'American', :dob => '1923/10/27', :period => 'Pop Art', :image => 'http://upload.wikimedia.org/wikipedia/en/thumb/4/4f/Roy_Lichtenstein.jpg/250px-Roy_Lichtenstein.jpg')
Painting.create(:title => 'Drowning Girl', :year => '1963', :style => 'Pop Art', :image => 'http://media.timeout.com/images/resizeBestFit/100226887/660/370/image.jpg')

Artist.create(:name => 'Fernand Leger', :nationality => 'French', :dob => '1881/2/4', :period => 'Cubism', :image => 'http://www.biography.com/imported/images/Biography/Images/Profiles/L/Fernand-Leger-39474-1-402.jpg')
Painting.create(:title => 'Three Women', :year => '1921', :style => 'Modern', :image => 'http://media.timeout.com/images/resizeBestFit/100226977/660/370/image.jpg')