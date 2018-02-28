class CollaboratorsController < ApplicationController
  
  
  def new
    @wiki = Wiki.find(params[:wiki_id])
    @collaboration = Collaborator.new
  end  
    
  def create
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.new(wiki_id: @wiki.id, user_id: params[:user_id])
    

    if @collaborator.save
      flash[:notice] = "Collaborator was added to this wiki."
      redirect_to @wiki
    else
      flash[:error] = "Collaborator was not added. Please try again."
      render :show
    end
  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.find(params[:id])

    if @collaborator.destroy
      flash[:notice] = "Delete successfull"
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error"
      redirect_to @wiki
    end
  end
  
  def collaborator_params
    params.require(:collaborator).permit( :email, :premium, :standard )
  end
end
