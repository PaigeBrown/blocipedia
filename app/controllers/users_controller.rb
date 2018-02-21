class UsersController < ApplicationController
  
  scope :visible_to, -> (user) {user && (user.premium? || user.admin?) ? all : where(:private => false || nil) }
  
  def create
    @user = User.new(params[:user])
    if @user.save
      UserNotifier.send_signup_email(@user).deliver
      redirect_to(@user, :notice => 'User created')
    else
      render :action => 'new'
    end
  end
  
  def downgrade
    @user = User.find(params[:id])
    @wikis = current_user.wikis
    puts "@user: #{@user.inspect} ---- current_user: #{current_user.inspect}"
    if @user == current_user
      @wikis.update_all(private: false)
     current_user.update_attribute(:role, 'standard')
 
     flash[:notice] = "#{current_user.email} your account has been downgraded"
     redirect_to edit_user_registration_path
    end
  end
  
  def show
    @wikis = policy_scope(Wiki)
  end
  
end