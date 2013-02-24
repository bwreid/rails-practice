require 'open-uri'

class PinterestController < ApplicationController
  def show
    # if params[:query].present?
    #   doc = Nokogiri::HTML(open("http://pinterest.com/search/pins/?q=#{params[:query]}"))
    #   images = doc.css('img')
    #   @urls = images.map { |i| i.get_attribute('src')}.select { |u| u.exclude?('avatar')}
    # else
      doc = Nokogiri::HTML(open('http://www.jackthreads.com/sales/9597'))
      divs = doc.css('div')
      binding.pry
      @urls = divs.map { |id| id.get_attribute('id') }.compact!
      @urls = @urls.select { |u| u.include?('product')}
      # @urls = images.map { |i| i.get_attribute('src')}.select { |u| u.exclude?('avatar')}
    # end

  end
end