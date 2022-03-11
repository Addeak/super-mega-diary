class ContactList
  def initialize(diary)
    @diary = diary
    @contacts = []
  end

  def grab_contacts
    @diary.entries.each do |entry|
      @contacts << entry.contents.scan(/[0-9]{11}/)
    end
  end

      
    
    # Gets contacts by calling contents from entry
    # Only picks up numbers of the correct length & avoids duplicates


  def show_contacts
    @contacts.flatten
  end
end