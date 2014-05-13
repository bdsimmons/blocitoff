require 'spec_helper'

describe List do
  it { should have_many(:items) }
end
