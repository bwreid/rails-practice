class StoriesController < ApplicationController
  def index
  end

  def scrape
    num = params['pages'].to_i
    scraper = Scrape.new(num)

    Story.delete_all

    scraper.get_data('https://news.ycombinator.com/news')

    (num-1).times do
      @more = Story.last.url
      @more = "/#{@more}" if @more == 'news2'
      Story.last.delete
      scraper.get_data("https://news.ycombinator.com#{@more}")
    end

    Story.last.delete
  end
end