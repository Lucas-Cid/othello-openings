class UsersController < ApplicationController

	def giveUsersParamsPermission (params)
		params.require(:user).permit(:name, :email, :username, :password)
	end


	def create
		permitedParamsUsers = giveUsersParamsPermission(params)
		@user = User.new(permitedParamsUsers)
		if @user.save
			UserMailer.token_confirmation_email(@user).deliver_now
		end
	end


	def show
		userObject = User.find(params.require(:id))
	  	respond_to do |format|
	    	user = { 
	    				:id => userObject[:id],
	    				:name => userObject[:name],
	    				:username => userObject[:username],
	    				:email => userObject[:email],
	    				:password => userObject[:password],
	    				:confimationToken => userObject[:confimationToken],
	    				:emailConfirmated => userObject[:emailConfirmated]
	    			}
	    	format.json  { render :json => user }
 	 	end
	end


	def update
		permitedParamsUsers = giveUsersParamsPermission(params)
		User.find(params.require(:id)).update(permitedParamsUsers)
	end


	def openings
		openingArray = []
		openingHash = Opening.where(user_id:params.require(:id))
	  	respond_to do |format|
	  		for i in 0..openingHash.length-1
		    	opening = { 
		    				:id => openingHash[i][:id],
		    				:name => openingHash[i][:name],
		    				:play_color => openingHash[i][:play_color],
		    				:playing_count => openingHash[i][:playing_count],
		    				:correct_answers_count => openingHash[i][:correct_answers_count],
		    				:priority => openingHash[i][:priority],
		    				:move_sequence => openingHash[i][:move_sequence].split
		    			  }
		    	openingArray.push(opening)
		    end
	    	format.json  { render :json => openingArray}
  		end
	end

	def emailConfirmation
		if params[:confirmationToken] == User.find(params[:id])[:confirmationToken]
			User.find(params[:id]).update(emailConfirmated:true)
		end
	end

end
