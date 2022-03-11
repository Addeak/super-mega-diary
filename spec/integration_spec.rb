require 'diary'
require 'diary_entry'
require 'todo'
require 'todo_list'
require 'contact_list'

RSpec.describe "integration" do
  context "after adding an entry" do
    it "reads the entry" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("1", "My life is great!")
      diary.add(entry_1)
      expect(diary.read("1")).to eq "My life is great!"
    end
  end

  context "after adding several entries" do
    it "reads the correct entry" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("1", "My life is great!")
      entry_2 = DiaryEntry.new("2", "My life is now absolutely crap!")
      entry_3 = DiaryEntry.new("3", "Now it's even worse, everyone I love has abandoned me!")
      diary.add(entry_1)
      diary.add(entry_2)
      diary.add(entry_3)
      expect(diary.read("2")).to eq "My life is now absolutely crap!"
    end
  end
end