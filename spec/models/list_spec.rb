require 'spec_helper'

describe List do
  it { should have_many(:items) }

  describe "#has_complete_items?" do
    let(:list) { List.create(title: "Groceries", description: "Grocery list") }

    it "returns true with completed list items" do
      list.items.create(content: "Eggs", completed_at: 1.minute.ago)
      expect(list.has_completed_items?).to be_true
    end

    it "returns false with no completed list items" do
      list.items.create(content: "Eggs")
      expect(list.has_completed_items?).to be_false
    end
  end

  describe "#has_incomplete_items?" do
    let(:list) { List.create(title: "Groceries", description: "Grocery list") }

    it "returns true with incompleted list items" do
      list.items.create(content: "Eggs")
      expect(list.has_incomplete_items?).to be_true
    end

    it "returns false with no incompleted list items" do
      list.items.create(content: "Eggs", completed_at: 1.minute.ago)
      expect(list.has_incomplete_items?).to be_false
    end
  end
end
