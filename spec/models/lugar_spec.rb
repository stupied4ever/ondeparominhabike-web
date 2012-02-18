require 'spec_helper'

describe Lugar do
  it {should validate_presence_of(:nome)}
  it {should validate_presence_of(:latitude)}
  it {should validate_presence_of(:longitude)}
  
end
