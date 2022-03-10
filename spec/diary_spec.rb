require 'diary'
require 'diary_entry'
require 'todo'

RSpec.describe "integration" do
  context "after adding an entry" do
    it "reads the entry" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("1", "My life is great!")
      expect(diary.read("1")).to eq "My life is great!"
    end
  end
end