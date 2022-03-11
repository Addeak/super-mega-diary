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

    it "recommends a list of readable entries based on available time and wpm" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("1", "My life is great!")
      entry_2 = DiaryEntry.new("2", "My life is now absolutely crap!")
      entry_3 = DiaryEntry.new("3", "Now it's even worse, everyone I love has abandoned me!")
      diary.add(entry_1)
      diary.add(entry_2)
      diary.add(entry_3)
      expect(diary.recommend_entry(2, 1)).to eq []
      expect(diary.recommend_entry(2, 2)).to eq ["1"]
      expect(diary.recommend_entry(2, 3)).to eq ["1", "2"]
      expect(diary.recommend_entry(3, 4)).to eq ["1", "2", "3"]
    end
  end

  describe "todo list integration" do
    context "given a task which is not done" do
      it "returns the task in a list of incomplete tasks" do
        list = TodoList.new
        task_1 = Todo.new("Get milk")
        list.add(task_1)
        expect(list.incomplete).to eq [task_1]
      end

      it "does not return the task in a list of complete tasks" do
        list = TodoList.new
        task_1 = Todo.new("Get milk")
        list.add(task_1)
        expect(list.complete).to eq []
      end
    end

    context "when given several tasks and some are completed" do
      it "returns lists of complete and incomplete tasks" do
        list = TodoList.new
        task_1 = Todo.new("Get milk")
        task_2 = Todo.new("Get bread")
        list.add(task_1)
        list.add(task_2)
        task_1.mark_done!
        expect(list.incomplete).to eq [task_2]
        expect(list.complete).to eq [task_1]
      end
    end
  end

  describe "contact list integration" do
    context "given diary entries containing phone numbers" do
      it "can extract them and show them" do
        diary = Diary.new
        entry_1 = DiaryEntry.new("1", "07000000000 called today")
        entry_2 = DiaryEntry.new("2", "My life is now absolutely crap!")
        diary.add(entry_1)
        diary.add(entry_2)
        pb = ContactList.new(diary)
        pb.grab_contacts
        expect(pb.show_contacts).to eq ["07000000000"]
      end
    end
  end
end