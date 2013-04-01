class Number
  # def Number.bin2dec(binary)
  #   i = 0
  #   r = 0
  #   m = 1
  #   while i < binary.length do
  #     r += (binary.reverse[i].to_i * m)
  #     i += 1
  #     m *= 2
  #   end
  #   r
  # end

  # Magic Ruby way
  def Number.bin2dec(binary)
    binary.reverse.split('').each_with_index.map { |v,i| ((v.to_i) * (2**i) ) }.reduce(:+)
  end

  def Number.dec2bin(num)
    r = ""
    while num != 0 do
      r += (num % 2).to_s
      num /= 2
    end
    r.reverse
  end
  # THIS ISN'T GREAT BECAUSE STRINGS ARE IMMUTABLE; NEW STRINGS GET CREATED EACH TIME

  # def Number.dec2bin(num)
  #   array = []
  #   Math.log2(num).ceil.times do
  #     array << num % 2
  #     num /= 2
  #   end
  #   array.join.reverse
  # end

  def Number.bin2hex(bin)
    result = []
    bin = bin.split('')
    (4 - (bin.length % 4)).times { bin.unshift("0") } if (bin.length % 4 != 0)

    bin.each_slice(4).to_a.each do |set|
      result << Number.bin2dec(set.join).to_s(16)
    end

    result.sum
  end

  def Number.hex2bin(hex)
    hex = hex.split('').map!{ |x| x.to_i(16) }.map!{ |x| Number.dec2bin(x) }
    hex.map! do |x|
      zeros = "0" * (4-x.length)
      x = zeros + x
    end

    hex.join
  end

end