class HomeController < ApplicationController
  def index
    @word_count = Declaration.first.words.length
  end

  def find
    word = Declaration.first.words.where( index: params[:count].to_i ).first.value

    hex = []
    word.split('').each do |x|
      hex << Character.where( symbol: x ).first.hex
    end
    hex = hex.join
    bin = Number.hex2bin(hex)
    dec = Number.bin2dec(bin)
    color = "##{hex[0..5]}"

    render :json => { word: word, hex: hex, bin: bin, dec: dec, color: color }
  end
end