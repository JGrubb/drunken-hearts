# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  guid       :string(255)
#  address    :text
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Order do
  pending "add some examples to (or delete) #{__FILE__}"
end
