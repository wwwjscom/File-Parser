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
  
  def get(i)
    @entries[i]
  end
  
  def sort_by_dob
    @entries.sort! { |a,b| (a.dob <=> b.dob) }
  end
  
end