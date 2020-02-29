class OpeningsController < ApplicationController

	def giveOpeningsParamsPermission (params)
		params.require(:opening).permit(:name, :move_sequence, :user_id, :play_color)
	end


	def create
		permitedParamsOpenings = giveOpeningsParamsPermission(params)
		@openings = Opening.new(permitedParamsOpenings)
		@openings.save
	end


	def importOpeningFile
		params[:path] = Rails.root + params[:path]
		@openings = Opening.new(name: PreparingOpeningFileToCreation.getingImportatedOpeningName(params), 
								move_sequence: PreparingOpeningFileToCreation.getingImportatedOpeningMoveSequence(params), 
								user_id: params.require(:user_id),
								play_color: "0")
		@openings.save
	end


	def show
		openingObject = Opening.find(params.require(:id))
	  	respond_to do |format|
	    	opening = { 
	    				:id => openingObject[:id],
	    				:name => openingObject[:name],
	    				:move_sequence => openingObject[:move_sequence].split,
	    				:play_color => openingObject[:play_color]
	    			  }
	    	format.json  { render :json => opening }
 	 	end
	end

	def update
		permitedParamsOpenings = giveOpeningsParamsPermission(params)
		Openings.find(params.require(:id)).update(permitedParamsOpenings)
	end


end

