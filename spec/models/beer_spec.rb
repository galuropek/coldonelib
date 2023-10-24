require 'rails_helper'

RSpec.describe Beer, type: :model do
  # it 'validates presence of title' do
  #   expect(Beer.new(name: 'The King Of Beer')).to_not be_valid
  # end

  it { should validate_presence_of :title }
  it { should validate_presence_of :brand }
end
