class Task < DBI::Model( :tasks )
  def status
    done ? 'done' : 'not done'
  end
  
  def check_off
    self.done = true
  end
end