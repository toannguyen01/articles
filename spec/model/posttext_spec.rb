require 'rails_helper'
RSpec.describe Posttext, type: :model do
  it { should validate_presence_of(:headline) }
end