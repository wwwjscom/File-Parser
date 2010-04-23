class Records
  
  attr :entries
  
  def initialize
    @entries = []
  end
  
  def << (record)
    raise "Obj should be a Record" unless record.class == Record
    @entries << record
  end
  
  def size
    @entries.size
  end
  
end