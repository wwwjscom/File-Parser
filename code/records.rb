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
  
  def sort_by_dob!
    @entries.sort! { |a,b| a.dob <=> b.dob }
  end
  
  def sort_by_ln!
    @entries.sort! { |a,b| a.ln <=> b.ln }
    @entries.reverse!
  end
  
  def sort_by_sex_then_ln!
    @entries.sort! { |a,b| [a.sex, a.ln] <=> [b.sex, b.ln] }
  end
  
  def to_s
    lines = []
    @entries.each do |e|
      lines << "#{e.ln}, #{e.fn}, #{e.sex}, #{e.dob.strftime('%m/%d/%Y')}, #{e.fav_color}\n"
    end
    lines.to_s
  end
  
end