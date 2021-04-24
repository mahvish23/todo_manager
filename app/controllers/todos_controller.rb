class TodosController < ApplicationController
  def index
    render plain: Todo.all_a
  end
end
