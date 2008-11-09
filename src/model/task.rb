class Task < DBI::Model( :tasks )
  def status
    done ? 'done' : 'not done'
  end
end