class SecretDiary
  attr_accessor :locked
  attr_accessor :entries

  def initialize
    @locked = true
    @entries = []
  end

  def add_entry(string)
    @locked == false ? @entries << string : "This diary is locked. Keep out!"
  end

  def get_entries
    @locked == false ? @entries : "This diary is locked. Keep out!"  
  end

  def unlock
    @locked = false
  end

  def lock
    @locked = true
  end

end