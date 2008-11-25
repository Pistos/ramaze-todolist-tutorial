class MainController < Ramaze::Controller
  
  layout '/layout' => [ :index, :new ]
  
  def index
    @title = 'Todo List'
    @tasks = Task.all
  end
  
  def new
    @title = 'New Task'
  end
  
  def create
    description = h( request[ 'description' ] ).strip
    
    begin
      Task.create( :description => description )
    rescue DBI::ProgrammingError => e
      if e.message =~ /minimum_description_length/
        fail 'Please enter an adequate description for the new task.'
        redirect Rs( :new )
      else
        raise e
      end
    end
    redirect Rs( :/ )
  end
  
  def check_off( id )
    task = ensure_task_exists( id )
    task.check_off
    redirect Rs( :/ )
  end
  
  def delete( id )
    task = ensure_task_exists( id )
    task.delete
    redirect Rs( :/ )
  end
  
  # -------------------------------------------------
  
  def fail( message )
    flash[ :error ] = message
  end
  private :fail
  
  def ensure_task_exists( id )
    task = Task[ id ]
    if task.nil?
      fail "No task with id #{id}."
      redirect_referrer
    end
    task
  end
  private :ensure_task_exists
  
end