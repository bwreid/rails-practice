# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Mixtape.delete_all
Album.delete_all
Artist.delete_all
Song.delete_all
Genre.delete_all

u = User.create( :name => 'johnnystorm', :balance => 3000, :password => 'password', :password_confirmation => 'password', :image => 'http://i0.wp.com/buddypress.org/wp-content/plugins/buddypress/bp-core/images/mystery-man.jpg' )
v = User.create( :name => 'haljordan', :balance => 50, :password => 'password', :password_confirmation => 'password', :image => 'http://i0.wp.com/buddypress.org/wp-content/plugins/buddypress/bp-core/images/mystery-man.jpg' )
w = User.create( :name => 'steverogers', :balance => 100, :password => 'password', :password_confirmation => 'password', :image => 'http://i0.wp.com/buddypress.org/wp-content/plugins/buddypress/bp-core/images/mystery-man.jpg' )
x = User.create( :name => 'superadmin', :balance => 1, :password => 'password', :password_confirmation => 'password', :image => 'http://i0.wp.com/buddypress.org/wp-content/plugins/buddypress/bp-core/images/mystery-man.jpg' )
x.is_admin = true
x.save

m = Mixtape.create( :name => "Library" )
n = Mixtape.create( :name => "Library" )
o = Mixtape.create( :name => "Library" )


u.mixtapes << m
v.mixtapes << n
w.mixtapes << o

g1 = Genre.create( :name => 'Rock' )
g2 = Genre.create( :name => 'Disco' )
g3 = Genre.create( :name => 'New Wave' )
g4 = Genre.create( :name => 'Pop' )
g5 = Genre.create( :name => 'R&B' )
g6 = Genre.create( :name => 'Soul' )
g7 = Genre.create( :name => 'Jazz' )
g8 = Genre.create( :name => 'Contemporary' )
g9 = Genre.create( :name => 'Experimental' )
g10 = Genre.create( :name => 'Synthpop' )
g11 = Genre.create( :name => 'Industrial' )
g12 = Genre.create( :name => 'Electronica' )
g13 = Genre.create( :name => 'Funk' )
g14 = Genre.create( :name => 'Neo Soul' )

# ++++++++++++++++++++++++++

blondie = Artist.create( :name => 'Blondie', :image => 'http://2.bp.blogspot.com/-0v915sRs8xw/UMezvfzjRSI/AAAAAAAAKfo/mkAYjEnbLdc/s1600/Blondie.jpg', :background => '/assets/blondie.png', :description => 'Est aliqua blog american apparel. Four loko meggings culpa kale chips, banh mi butcher chambray locavore adipisicing. Tattooed selfies vice 8-bit bushwick vinyl plaid. Twee mlkshk bicycle rights, sint do hashtag kogi artisan fanny pack cosby sweater truffaut. Etsy qui post-ironic in meggings est. Cosby sweater bicycle rights minim, portland cred cray blog flexitarian whatever selvage sint butcher aute. Biodiesel fashion axe hoodie flannel.' )
al1 = Album.create( :name => 'Eat to the Beat', :image => 'http://images.wikia.com/lyricwiki/images/7/72/Blondie_-_Eat_To_The_Beat.jpg' )
s1 = Song.create( :price => 1.29, :name => 'Atomic', :filename => '04VfsMOb8RA' )
s2 = Song.create( :price => 1.29, :name => 'Dreaming', :filename => 'fOnv8lXDzhg' )
s3 = Song.create( :price => 1.29, :name => 'Union City Blue', :filename => 'RULEJ8yBq_s')

s1.genres << g1 << g2 << g3
s2.genres << g1 << g2 << g3
s3.genres << g2 << g4

blondie.songs << s1 << s2 << s3
al1.songs << s1 << s2 << s3

# ++++++++++++++++++++++++++

emilyking = Artist.create( :name => 'Emily King', :image => 'http://www.myplay.com/files/imagecache/photo_345_square/files/artist_images/dxc__mg1705326.jpg', :background => '/assets/emilyking.png', :description => 'Est aliqua blog american apparel. Four loko meggings culpa kale chips, banh mi butcher chambray locavore adipisicing. Tattooed selfies vice 8-bit bushwick vinyl plaid. Twee mlkshk bicycle rights, sint do hashtag kogi artisan fanny pack cosby sweater truffaut. Etsy qui post-ironic in meggings est. Cosby sweater bicycle rights minim, portland cred cray blog flexitarian whatever selvage sint butcher aute. Biodiesel fashion axe hoodie flannel.' )
al3 = Album.create( :name => 'Seven', :image => 'http://f0.bcbits.com/z/28/20/2820503696-1.jpg')
s7 = Song.create( :price => 1.29, :name => 'No More Room', :filename => 'Xe1tnyQH-v8' )
s8 = Song.create( :price => 1.29, :name => 'Georgia', :filename => 'GJOsq3uD-GA' )
s9 = Song.create( :price => 1.29, :name => 'Down', :filename => 'sN3skRe_cpA' )

s7.genres = [g5, g6, g7, g8]
s8.genres = [g5, g6, g7, g8]
s9.genres = [g5, g6, g7, g8]

emilyking.songs << s7 << s8 << s9
al3.songs << s7 << s8 << s9

# ++++++++++++++++++++++++++

grimes = Artist.create( :name => 'Grimes', :image => 'http://www.etmusiquepourtous.com/wp-content/uploads/2012/09/grimes2.jpeg', :background => '/assets/grimes.png', :description => 'Est aliqua blog american apparel. Four loko meggings culpa kale chips, banh mi butcher chambray locavore adipisicing. Tattooed selfies vice 8-bit bushwick vinyl plaid. Twee mlkshk bicycle rights, sint do hashtag kogi artisan fanny pack cosby sweater truffaut. Etsy qui post-ironic in meggings est. Cosby sweater bicycle rights minim, portland cred cray blog flexitarian whatever selvage sint butcher aute. Biodiesel fashion axe hoodie flannel.' )
al4 = Album.create( :name => 'Vision', :image => 'http://www.followthesignal.com/wp-content/uploads/2012/02/grimes-visions.png')
s10 = Song.create( :price => 1.29, :name => 'Eight', :filename => 'HqLu_eWjP_Y' )
s11 = Song.create( :price => 1.29, :name => 'Be A Body', :filename => '3Z9iwtvr0Bc' )
s12 = Song.create( :price => 1.29, :name => 'Oblivion', :filename => 'm5H-YlcMSbc' )

s10.genres = [g9, g10, g11]
s11.genres = [g9, g10, g11]
s12.genres = [g9, g10, g11]

grimes.songs = [s10, s11, s12]
al4.songs = [s10, s11, s12]

# ++++++++++++++++++++++++++

jamesblake = Artist.create( :name => 'James Blake', :image => 'http://www.ssgmusic.com/wp-content/uploads/2011/12/JamesBlake.jpg', :background => '/assets/jamesblake.png', :description => 'Est aliqua blog american apparel. Four loko meggings culpa kale chips, banh mi butcher chambray locavore adipisicing. Tattooed selfies vice 8-bit bushwick vinyl plaid. Twee mlkshk bicycle rights, sint do hashtag kogi artisan fanny pack cosby sweater truffaut. Etsy qui post-ironic in meggings est. Cosby sweater bicycle rights minim, portland cred cray blog flexitarian whatever selvage sint butcher aute. Biodiesel fashion axe hoodie flannel.' )
al5 = Album.create( :name => 'James Blake', :image => 'http://essentiallyeclectic.files.wordpress.com/2011/02/james-blake-album-cover1.jpg')
s13 = Song.create( :price => 1.29, :name => 'Lindisfarne', :filename => 'oSTyfB_8Ud8' )
s14 = Song.create( :price => 1.29, :name => 'A Case of You', :filename => 'Ri6bd4G-Aig' )
s15 = Song.create( :price => 1.29, :name => 'The Wilhelm Scream', :filename => 'MVgEaDemxjc' )

s13.genres = [g8, g9, g12]
s14.genres = [g8, g9, g12]
s15.genres = [g8, g9, g12]

jamesblake.songs = [s13, s14, s15]
al5.songs = [s13, s14, s15]

# ++++++++++++++++++++++++++

solange = Artist.create( :name => 'Solange', :image => 'http://www.vibevixen.com/wp-content/uploads/2012/07/vibevixen-solange-instagram.jpg', :background => '/assets/solange.png', :description => 'Est aliqua blog american apparel. Four loko meggings culpa kale chips, banh mi butcher chambray locavore adipisicing. Tattooed selfies vice 8-bit bushwick vinyl plaid. Twee mlkshk bicycle rights, sint do hashtag kogi artisan fanny pack cosby sweater truffaut. Etsy qui post-ironic in meggings est. Cosby sweater bicycle rights minim, portland cred cray blog flexitarian whatever selvage sint butcher aute. Biodiesel fashion axe hoodie flannel.' )
al6 = Album.create( :name => 'True', :image => 'http://cdn.rap-up.com/blog/wp-content/uploads/2012/10/solange-true-cover.jpg')
s16 = Song.create( :price => 1.29, :name => 'Lovers in the Parking Lot', :filename => 'bRt5rwlJCJQ' )
s17 = Song.create( :price => 1.29, :name => 'Locked in Closets', :filename => 'kwlWRPEx4W8' )
s18 = Song.create( :price => 1.29, :name => 'Don\'t Let Me Down', :filename => 'NmV4mJzoGMQ' )

s16.genres = [g5, g13, g14]
s17.genres = [g5, g13, g14]
s18.genres = [g5, g13, g14]

solange.songs = [s16, s17, s18]
al6.songs = [s16, s17, s18]

# ++++++++++++++++++++++++++