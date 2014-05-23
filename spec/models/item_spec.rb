require 'spec_helper'

describe Item do
  it { should belong_to(:list) }

  describe "#completed?" do
    let(:item) { Item.create(content: "Hello") }

    it "is false when completed_at is blank" do
      item.completed_at = nil
      expect(item.completed?).to be_false
    end

    it "returns true when completed_at is not empty" do
      item.completed_at = Time.now
      expect(item.completed?).to be_true
    end
  end
end
