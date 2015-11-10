class UsersController < ApplicationController

def index

end

def new
	@user = User.new
end

def show

end

def edit
	@user = User.find(params[:id])
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

def additional_params
	params.require(:user).permit(:username, :address, :bio, :is_rn)
end



end
