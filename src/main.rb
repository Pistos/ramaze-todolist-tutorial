class MainController < Ramaze::Controller
  
  def index
    @tasks = Task.all
  end
  
  def create
    Task.create( :description => h( request[ 'description' ] ) )
    redirect Rs( :/ )
  end
  
end