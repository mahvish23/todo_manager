class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.all.map { |user| user.to_pleasant_string }.join("\n")
  end

  def create
    user_name = params[:first_name]
    user_email = params[:email]
    password = params[:password_digest]
    new_user = User.create!(first_name: user_name, email: user_email, password_digest: password)
    response_text = "Hey #{user_name}, you have been successfully added!"
    render plain: response_text
  end

  def login
    user_email = params[:email]
    password = params[:password_digest]
    render plain: User.auth?(user_email, password)
  end
end
