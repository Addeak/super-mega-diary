require 'todo_list'

RSpec.describe TodoList do
  context "when initialised" do
    it "has an empty list of completed tasks" do
      list = TodoList.new
      expect(list.complete).to eq []
    end

    it "has an empty list of incomplete tasks" do
      list = TodoList.new
      expect(list.incomplete).to eq []
    end
  end
end