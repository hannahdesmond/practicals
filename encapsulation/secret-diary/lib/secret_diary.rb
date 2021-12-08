class SecretDiary
  attr_accessor :lock

  def initialize
    @lock = true
  end

  def add_entry(string)
    @lock == false ? string: "This diary is locked. Keep out!"
  end

  def get_entries
    "This diary is locked. Keep out!"
  end

  def unlock
    @lock = false
  end

end