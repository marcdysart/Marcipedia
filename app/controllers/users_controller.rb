class UsersController < ApplicationController
  def index
    @users = User.all
    @wikis = policy_scope(Wiki)
  end

  def show
    @users = User.all
  end

  def new
    @users = User.all
  end

  def edit
    @users = User.all
  end

  def update
    @users = User.all
   end

end
