class UsersController < Clearance::UsersController
	
  def show
    @user = User.find(params[:id])
  end

  private

	def user_from_params
    User.new(user_params)
    # User.new({name: 'adsas', email: 'dasdas'})
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
    # params = {user: {name: 'adasd', email: 'dasd', password: 'asda'}}
    # params[:user]
  end

end
