# == Schema Information
#
# Table name: words
#
#  id             :integer          not null, primary key
#  value          :string(255)
#  declaration_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'spec_helper'

describe Word do
  pending "add some examples to (or delete) #{__FILE__}"
end
