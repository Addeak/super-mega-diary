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
┌────────────────────────────────────────────────────┐
│                                                    │
│                                                    │
│     DIARY                                          │
│    ─────────────────────────                       │
│                                                    │
│    add(entry)                                      │
│                                                    │
│    read(title)                                     │
│                                                    │
│     recommend_entry(time,speed)                    │
│                                                    │
│     check_for_contact(entry)                       │
│                                                    │
│     show_contacts                                  │
│                                                    │
│                                                    │
│                                                    │
└────────────────────────────────────────────────────┘


┌────────────────────────────────────────────────────┐    ┌──────────────────────────────────────────┐
│                                                    │    │                                          │
│    DiaryEntry                                      │    │ Todo                                     │
│   ─────────────────────────────                    │    │ ──────────────────────────               │
│                                                    │    │                                          │
│    title                                           │    │ task                                     │
│                                                    │    │                                          │
│    content                                         │    │ done?                                    │
│                                                    │    │                                          │
│    reading_time(speed)                             │    │ mark_done!                               │
│                                                    │    │                                          │
│    count_words                                     │    │                                          │
│                                                    │    │                                          │
│                                                    │    │                                          │
└────────────────────────────────────────────────────┘    └──────────────────────────────────────────┘
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

  def check_for_contact(entry) # Entry is an instance of DiaryEntry
    # Gets contacts by calling contents from entry
    # Only picks up numbers fo the correct length & avoids duplicates
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
# EXAMPLE

# Gets all tracks
library = MusicLibrary.new
track_1 = Track.new("Carte Blanche", "Veracocha")
track_2 = Track.new("Synaesthesia", "The Thrillseekers")
library.add(track_1)
library.add(track_2)
library.all # => [track_1, track_2]
```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE

# Constructs a track
track = Track.new("Carte Blanche", "Veracocha")
track.title # => "Carte Blanche"
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._


<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/golden-square&prefill_File=resources/multi_class_recipe_template.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/golden-square&prefill_File=resources/multi_class_recipe_template.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/golden-square&prefill_File=resources/multi_class_recipe_template.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/golden-square&prefill_File=resources/multi_class_recipe_template.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/golden-square&prefill_File=resources/multi_class_recipe_template.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->