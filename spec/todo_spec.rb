require 'todo'

RSpec.describe Todo do
  context "given a task" do
    it "returns the task" do
      todo = Todo.new("aaa")
      expect(todo.task).to eq "aaa"
    end

    it "knows the task is incomplete" do
      todo = Todo.new("aaa")
      expect(todo.done?).to eq false
    end
  end

  context "when a task is marked complete" do
    it "knows the task is complete" do
      todo = Todo.new("aaa")
      todo.mark_done!
      expect(todo.done?).to eq true
    end
  end

  context "given an empty string" do
    it "raises an error" do
      expect { Todo.new("") }.to raise_error "Error: no task given"
    end
  end
end