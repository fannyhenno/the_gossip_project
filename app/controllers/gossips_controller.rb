class GossipsController < ApplicationController
  
  def gossip
  end

    def index
  	@gossips = Gossip.all
  end

  def new
  	@gossip = Gossip.new
  end

  def create
		@gossip = Gossip.new(gossip_params)
		if @gossip.save
		redirect_to @gossip
		else 
			render "new"
		end
	end

  def show
  	@gossip = Gossip.find(params[:id])
  end

  def gossip_params
		params.permit(:anonymous_author, :content)
  end

  def destroy
  	@gossip = Gossip.find(params[:id])
  	@gossip.destroy
  	
  	redirect_to index_path
  end  

end
