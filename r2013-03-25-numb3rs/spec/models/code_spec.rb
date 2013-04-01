# == Schema Information
#
# Table name: codes
#
#  id         :integer          not null, primary key
#  url        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Code do
  before(:each) do
    Code.create(url: 'http://www.ascii-code.com')
  end

  describe '.create' do
    it 'should create a code object' do
      expect(code).to_not be nil
    end
  end

  describe '#hex' do
    it 'gets the hex character' do
      symbol = Code.where(:hex => '41').first
      expect(code.hex).to be '41'
      expect(code.symbol).to be 'A'
    end
  end

  describe '#symbol' do
    it 'gets the symbol character' do
      symbol = Code.where(:symbol => 'A').first
      expect(code.hex).to be '41'
      expect(code.symbol).to be 'A'
    end
  end
end
