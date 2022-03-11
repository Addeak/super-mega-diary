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

  describe "word count method" do
    it "returns the number of words in an entry's content" do
      entry = DiaryEntry.new("1", "My life is great!")
      expect(entry.count_words).to eq 4
    end
  end

  describe "reading time method" do
    context "given a reading speed" do
      it "returns an estimatetd reading time in minnutes" do
        entry = DiaryEntry.new("1", "My life is great!")
        expect(entry.reading_time(4)).to eq 1
      end

      it "returns a rounded up time instead of a decimal" do
        entry = DiaryEntry.new("1", "Yes, my life is great!")
        expect(entry.reading_time(4)).to eq 2
      end
    end
  end
end
