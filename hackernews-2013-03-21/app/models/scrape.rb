class Scrape
  attr_accessor :pages

  def initialize(pages)
    @pages = pages
  end

  def get_data(url)
    Nokogiri::HTML(open(url)).css('td.title a').each do |x|
      Story.create( title: x.text, url: x.attr('href') )
    end
  end

end