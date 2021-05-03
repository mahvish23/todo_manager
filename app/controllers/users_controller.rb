class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new_todo
    render "user/new"
  end

  def index
    render plain: User.all.map { |user| user.to_pleasant_string }.join("\n")
  end

  def create
    user_name = params[:first_name]
    user_email = params[:email]
    password = params[:password]
    user = User.create!(first_name: user_name, email: user_email, password: password)
    if user.save
      session[:current_user_id] = user.id
      redirect_to todos_path
    else
      redirect_to new_user_path
    end
  end

  def login
    user_email = params[:email]
    password = params[:password_digest]
    render plain: User.auth?(user_email, password)
  end
end
