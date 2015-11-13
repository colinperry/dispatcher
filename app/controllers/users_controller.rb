class UsersController < ApplicationController

def index

end

def new
	@user = User.new
end

def show
	@user = User.find(params[:id])
end

def edit
	@user = current_user
end

def profile
	@user = current_user
	render :show
end

def create
	@user = User.create( user_params )
end

def update

end

def destroy

end

def search
	nurses = User.AllNurses
	@local_nurses = nurses.near([current_user.latitude, current_user.longitude], 5)
end

def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
end

private

def user_params
  params.require(:user).permit(:avatar)
end

def additional_params
	params.require(:user).permit(:username, :address, :bio, :is_rn, :fname, :lname)
end



end
