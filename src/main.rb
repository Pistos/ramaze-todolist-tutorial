class MainController < Ramaze::Controller
  def index
    @tasks = Task.all
  end
end