class CollaboratorsController < ApplicationController

  def new
    @collaborator = Collaborator.new
    @wiki = Wiki.find(params[:wiki_id])
    @users = User.all


  def create

    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = @wiki.collaborators.build(params[:collaborator])
    if @collaborator.save
      flash[:notice] = "Collaborators were added."

    else
      flash[:error] = "There was an error adding Collaborators. Please try again."
    end

    redirect_to @wiki
  end

    def update
      @wiki = Wiki.find(params[:wiki_id])
      @collaborator = @wiki.collaborators.build(params[:collaborator])

      if @collaborator.save
        flash[:notice] = "Successfully added collaborator."
      else
        flash[:notice] = "There was an error."
      end

      redirect_to @wiki
    end

  def destroy
    @collaborator = Collaborator.find(params[:id])
    @wiki = Wiki.find(params[:wiki_id])

     if @collaborator.destroy
       flash[:notice] = "Collaborator was successfully removed."
       redirect_to wikis_path
     else
       flash[:error] = "Collaborator could not be removed"
     end
   end

end
