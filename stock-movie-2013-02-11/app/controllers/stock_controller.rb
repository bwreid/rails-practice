class StockController < ApplicationController
  def index
  end

  def info
  end

  def find
    @stock = params['stock'].upcase
    @quote = YahooFinance::get_quotes(YahooFinance::StandardQuote, "#{@stock}")["#{@stock}"].lastTrade
    render '/stock/info'
  end

end
