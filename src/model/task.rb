class Task < DBI::Model( :tasks )
  def status
    done ? 'done' : 'not done'
  end
  
  def close
    self.done = true
  end
end