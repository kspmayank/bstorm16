class WelcomeController < ApplicationController
  def index
  end

  def admin
  end

  def leaderboard
  	# if current_user.is_admin == true
  		@u = User.order('level_id DESC')
      
  	# else
  		# redirect_to '/play/'+current_user.level_id.to_s
  	# end
  end

  def rules
  end

  def addname
    @name = params[:user][:name]
    current_user.name = @name
    current_user.save
    redirect_to '/'
  end
end
