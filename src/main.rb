class MainController < Ramaze::Controller
  
  def index
    @tasks = Task.all
  end
  
  def create
    Task.create( :description => request[ 'description' ] )
    redirect Rs( :/ )
  end
  
  def close( id )
    Task[ id ].close
    redirect Rs( :/ )
  end
end