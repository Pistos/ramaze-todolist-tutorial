class MainController < Ramaze::Controller
  
  layout '/layout', [ :create, :new ]
  
  def index
    @title = 'Todo List'
    @tasks = Task.all
  end
  
  def new
    @title = 'New Task'
  end
  
  def create
    Task.create( :description => h( request[ 'description' ] ) )
    redirect Rs( :/ )
  end
  
  def check_off( id )
    Task[ id ].check_off
    redirect Rs( :/ )
  end
  
  def delete( id )
    Task[ id ].delete
    redirect Rs( :/ )
  end
end