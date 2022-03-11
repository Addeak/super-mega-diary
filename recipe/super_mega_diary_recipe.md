# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

As a user
So that I can record my experiences
I want to keep a regular diary

As a user
So that I can reflect on my experiences
I want to read my past diary entries

As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed

As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary

As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

diary
diary entries
reading time
reading speed
tasks
to do list
contacts
contact list
record
read past entries
select entries
see a list

```
                ┌──────────────────┐
                │ ContactList      │
                │ ───────────────  │
                │ grab_contacts    │
                │                  │
                │ show_contacts    │
                └──────────────────┘
                          ▲
┌─────────────────────┐   │     ┌─────────────────┐
│ Diary               │   │     │DiaryEntry       │
│ ──────────────────  │   │     ├─────────────    │
│                     ├───┘     │                 │
│ add(entry)          │         │title            │
│                     │         │                 │
│ read                │         │contents         │
│                     │◄────────┤                 │
│ recommend_entry  │  │         │reading_time     │
│                  └──┼─────────┤►                │
│                     │         │count_words      │
└─────────────────────┘         └─────────────────┘


┌────────────────────┐       ┌─────────────────┐
│TodoList            │       │  Todo           │
├─────────────────   │       │ ──────────────  │
│                    │       │                 │
│add(task)           │       │ task            │
│                    │◄──────┤                 │
│complete            │       │ done?           │
│                    │       │                 │
│incomplete          │       │ mark_done!      │
└────────────────────┘       └─────────────────┘
```

_Also design the interface of each class in more detail._

```ruby
class Diary
  def initialize
  end

  def add(entry) # Entry is an instance of DiaryEntry
    # Return nothing
  end

  def read(title) # Title is a string title of a DiaryEntry
    # Returns the contents of a DiaryEntry 
  end

  def recommend_entry(time, speed) # Time is time available for reading as an int
                                   # Speed is reading speed in words per minute as an int
    # Returns an array list of all entries that could be read within the given time
  end
end

class ContactList
  def initialize
  end

  def grab_contacts
    # Gets contacts by calling contents from entry
    # Only picks up numbers of the correct length & avoids duplicates
  end

  def show_contacts
    # Returns list of contacts
  end
end

class DiaryEntry
  def initialize(title, contents)
  end

  def title
  # Returns title
  end

  def contents
  # Returns contents
  end

  def reading_time(speed) # Speed is reading speed in words per minute as an int
  # Returns time to read the entry in minutes as an int
  end

  def count_words
  # Returns number of words in contents as an int
  end
end

class TodoList
  def initialize
  end

  def add(task)
    # Returns nothing
  end

  def complete
    # Returns list of tasks marked complete
  end

  def incomplete
    # Returns list of tasks marked incomplete
  end
end

class Todo
  def initialize(task) # Task is a string
  end

  def task
  # Returns the task
  end

  def done?
  # Returns true if done, false otherwise
  end

  def mark_done!
  end
end
```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# 1
diary = Diary.new
entry_1 = DiaryEntry.new("1", "My life is great!")
diary.add(entry_1)
diary.read("1") # => "My life is great!"

# 2
diary = Diary.new
entry_1 = DiaryEntry.new("1", "My life is great!")
entry_2 = DiaryEntry.new("2", "My life is now absolutely crap!")
entry_3 = DiaryEntry.new("3", "Now it's even worse, everyone I love has abandoned me!")
diary.add(entry_1)
diary.add(entry_2)
diary.add(entry_3)
diary.read("2") # => "My life is now absolutely crap!"

# 3
diary = Diary.new
entry_1 = DiaryEntry.new("1", "My life is great!")
entry_2 = DiaryEntry.new("2", "My life is now absolutely crap!")
entry_3 = DiaryEntry.new("3", "Now it's even worse, everyone I love has abandoned me!")
diary.add(entry_1)
diary.add(entry_2)
diary.add(entry_3)
diary.recommend_entry(2, 1) # => []
diary.recommend_entry(2,2) # => ["My life is great!"]
diary.recommend_entry(2,3) # => ["My life is great!", "My life is now absolutely crap!"]
diary.recommend_entry(3,4) # => ["My life is great!", "My life is now absolutely crap!", "Now it's even worse, everyone I love has abandoned me!"]

# 4
list = TodoList.new
task_1 = Todo.new("Get milk")
list.add(task_1)
list.incomplete # => [task_1]

# 5
list = TodoList.new
task_1 = Todo.new("Get milk")
list.add(task_1)
list.complete # => []

# 6 
list = TodoList.new
task_1 = Todo.new("Get milk")
task_2 = Todo.new("Get bread")
list.add(task_1)
list.add(task_2)
task_1.mark_done!
list.incomplete # => [task_2]
list.complete # => [task_1]

# 7
diary = Diary.new
entry_1 = DiaryEntry.new("1", "07000000000 called today")
entry_2 = DiaryEntry.new("2", "My life is now absolutely crap!")
diary.add(entry_1)
diary.add(entry_2)
pb = ContactList.new(diary)
pb.grab_contacts
pb.show_contacts # => ["07000000000"]

# 8
diary = Diary.new
entry_1 = DiaryEntry.new("1", "07000000000 called today")
entry_2 = DiaryEntry.new("2", "My life is now absolutely crap! 2384")
entry_3 = DiaryEntry.new("2", "My life is now absolutely crap! 07111111111111111")
diary.add(entry_1)
diary.add(entry_2)
diary.add(entry_3)
pb = ContactList.new(diary)
pb.grab_contacts
pb.show_contacts # => ["07000000000"]

# 9
diary = Diary.new
entry_1 = DiaryEntry.new("1", "07000000000 called today")
entry_2 = DiaryEntry.new("2", "My life is now absolutely crap! 07000000001")
diary.add(entry_1)
diary.add(entry_2)
pb = ContactList.new(diary)
pb.grab_contacts
pb.show_contacts # => ["07000000000", "07000000001"]

# 10
diary = Diary.new
entry_1 = DiaryEntry.new("1", "07000000000 called today")
entry_2 = DiaryEntry.new("2", "My life is now absolutely crap! 07000000000")
diary.add(entry_1)
diary.add(entry_2)
pb = ContactList.new(diary)
pb.grab_contacts
pb.show_contacts # => ["07000000000"]
```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
## DiaryEntry
# 1
entry = DiaryEntry.new("1", "My life is great!")
entry.title # => 1

# 2
entry = DiaryEntry.new("1", "My life is great!")
entry.contents # => "My life is great!"

# 4
entry = DiaryEntry.new("1", "My life is great!")
entry.reading_time(4) # => 1

# 4
entry = DiaryEntry.new("1", "Yes, my life is great!")
entry.reading_time(4) # => 2

# 5
entry = DiaryEntry.new("1", "My life is great!")
entry.count_words # => 4

## Todo
# 1
todo = Todo.new("aaa")
todo.task # => "aaa"

# 2
todo = Todo.new("aaa")
todo.done? # => false

# 3
todo = Todo.new("aaa")
todo.mark_done!
todo.done? # => true

## TodoList
# 1
list = Todolist.new
list.complete # => []

# 2
list = TodoList.new
list.incomplete # => []

##Diary
# 1
diary = Diary.new
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._
