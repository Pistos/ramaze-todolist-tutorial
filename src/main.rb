class MainController < Ramaze::Controller
  
  def index
    @tasks = Task.all
  end
  
  def create
    Task.create( :description => request[ 'description' ] )
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