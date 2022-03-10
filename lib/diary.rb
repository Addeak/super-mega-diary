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
