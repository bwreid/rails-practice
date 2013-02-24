module ApplicationHelper

  def is_admin
    @auth.present? && @auth.is_admin
  end

  def admin_bar
    "<ul class='left'>" +
      "<li class='has-dropdown'><a href='#'>Create New</a>" +
      "<ul class='dropdown'>" +
      "<li>#{ link_to('Song', new_song_path) }</li>" +
      "<li>#{ link_to('Artist', new_artist_path) }</li>" +
      "<li>#{ link_to('Album', new_album_path) }</li>" +
      "<li>#{ link_to('Genre', new_genre_path) }</li>" +
      "</ul>" +
      "</li>" +
      "</ul>" +
      "<ul class='left'><li>#{link_to('Users', users_path)}</li></ul>"
  end

  def mixtapes_bar
    list = ''
    @auth.mixtapes.each do |mixtape|
      list += "<li>#{ link_to(mixtape.name, mixtape) }</li>"
    end

    "<ul class='left'>" +
      "<li class='has-dropdown'><a href='#'>My Mixtapes</a>" +
        "<ul class='dropdown'>" +
          (list) +
          "<li class='divider'></li>" +
          "<li>#{ link_to("New Mixtape", new_mixtape_path) }</li>" +
        "</ul>" +
      "</li>" +
    "</ul>"
  end

  def intelli_nav
    if @auth.nil?
      "<ul class='right'><li>#{link_to('Create Account', new_user_path)}</li></ul>" +
        "<ul class='right'><li>#{link_to("Login", login_path)}</li></ul>"
    else
      ((@auth.present? && !@auth.is_admin) ? mixtapes_bar : '') +
      (@auth.is_admin ? admin_bar : '') +
      "<ul class='right'><li>#{ link_to('Log Out', login_path, :method => 'delete') }</li></ul>" +
      "<ul class='right'><li>#{ link_to('My Account (' + number_to_currency(@auth.balance).to_s + ')', edit_users_path) }</li></ul>"
    end
  end

end
