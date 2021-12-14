class SecretDiary
  attr_accessor :locked
  attr_accessor :entries

  def initialize
    @locked = true
    @entries = []
  end

  def unlock
    @locked = false
  end

  def lock
    @locked = true
  end
end

class NewEntry
  def add_entry(diary, string)
    diary.locked == false ? diary.entries << string : raise("This diary is locked. Keep out!")
  end
end

class GetEntries
  def get_entries(diary)
    diary.locked == false ? diary.entries : raise("This diary is locked. Keep out!")
  end
end
