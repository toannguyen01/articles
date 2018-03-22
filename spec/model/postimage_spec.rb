require 'rails_helper'
RSpec.describe Postimage, type: :model do
  it { should validate_presence_of(:headline) }
end