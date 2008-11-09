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
    description = request[ 'description' ]
    return if description.nil?
    
    title.strip!
    if title.empty?
      fail 'Please enter a description for the new task.'
      redirect '/new'
    end
    
    Task.create( :description => h( request[ 'description' ] ) )
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