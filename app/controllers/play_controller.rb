class PlayController < ApplicationController
  def index
    p "current user"
    p current_user.level_id
    if current_user.level_id == nil
    p  current_user.level_id = 1
      current_user.save
    end
  	@u = current_user.level_id
  	redirect_to '/play/'+@u.to_s
  end

  def show
  	p @l = params[:id].to_i
  	p @u = current_user.level_id.to_i
  	if @u == @l
  		p @lvl = Level.find(@u)
  		@at = Attempt.where(user_id: current_user.id)
  	else
  		redirect_to '/play/'+@u.to_s
  	end
  end

  def attempt
  	@a = params[:attempt][:attempt].downcase.to_s
  	@l = params[:id]
  	@lvl = Level.find(@l)
  	if @a==@lvl.answer.downcase.to_s
  		Attempt.create(level_id: @l.to_i, user_id: current_user.id, attempt: @a)
  		p current_user.level_id += 1
  		current_user.save
  	else
  		Attempt.create(level_id: @l.to_i, user_id: current_user.id, attempt: @a)
  	end
  	redirect_to '/play/'+current_user.level_id.to_s
  end
end
