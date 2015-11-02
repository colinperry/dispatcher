class UserController < ApplicationController

def index
	@users = User.all
end

def new
	@user = User.new
end

def show

end

def edit

end

def profile
	@user = current_user
	render :show
end

def create

end

def update

end

def destroy

end
