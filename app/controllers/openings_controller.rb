class OpeningsController < ApplicationController

	def giveOpeningsParamsPermission (params)
		params.require(:opening).permit(:name, :move_sequence, :user_id, :play_color)
	end



	def create
		permitedParamsOpenings = giveOpeningsParamsPermission(params)
		@openings = Opening.new(permitedParamsOpenings)
		@openings.save
	end


	def show
		openingArray = []
		openingHash = Opening.where(user_id:params.require(:user_id))
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


	def getingImportatedOpeningName(params)
		openingName = params.require(:path).split("/")
		openingName[openingName.length-1]
	end


	def getingImportatedOpeningMoveSequence(params)
		content = File.read(params.require(:path))
		content.split("]\r\n\r\n")[1]
	end


	def importOpeningFile
		@openings = Opening.new(name: getingImportatedOpeningName(params), 
								move_sequence: getingImportatedOpeningMoveSequence(params), 
								user_id: params.require(:user_id),
								play_color: "0")
		@openings.save
	end

	# def showOpeningById
	# 	openingObject = Opening.find(params.require(:opening_id))
	#   	respond_to do |format|
	#     	opening = { 
	#     				:id => openingObject[:id],
	#     				:name => openingObject[:name],
	#     				:move_sequence => openingObject[:move_sequence].split,
	#     				:play_color => openingObject[:play_color]
	#     			  }
	#     	format.json  { render :json => opening }
 	#  		end
	# end


end

