require 'diary_entry'

RSpec.describe "DiaryEntry" do
  context "initially" do 
    it "returns a title " do
      entry = DiaryEntry.new("1", "My life is great!")
      expect(entry.title).to eq "1"
    end

    it "returns a contents" do
      entry = DiaryEntry.new("1", "My life is great!")
      expect(entry.contents).to eq "My life is great!"
    end
  end
end
