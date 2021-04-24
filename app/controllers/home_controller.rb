class HomeController < ApplicationController
  def index
    @todos = Todo.all
    render "index"
  end
end
