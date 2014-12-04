class WikisController < ApplicationController
  def index
    @wikis = policy_scope(Wiki)
    @users = User.all

  end

  def show
    @wiki = Wiki.find(params[:id])
    @user = Wiki.find(params[:id])
    @collaborators = @wiki.users
    authorize @wiki
  end

  def new
      @users = User.all
      @wiki = Wiki.new
      @collaborators = @wiki.collaborators.build
      @user = @collaborators.build_user
      authorize @wiki
  end

  def create

     @wiki = Wiki.new(wiki_params)
     authorize @wiki
     @users = User.all
     if @wiki.save
       flash[:notice] = "Wiki was saved."
       redirect_to @wiki
     else
       flash[:error] = "There was an error saving the wiki. Please try again."
       render :new
     end
   end

  def edit
         @wiki = Wiki.find(params[:id])
         @users = User.all
         authorize @wiki
  end

  def update
     @wiki = Wiki.find(params[:id])
     authorize @wiki
     @users = User.all
     if @wiki.update_attributes(wiki_params)
       flash[:notice] = "Wiki was updated."
       redirect_to @wiki
     else
       flash[:error] = "There was an error saving the wiki. Please try again."
       render :edit
     end
   end

  def destroy
     @wiki = Wiki.find(params[:id])
     title = @wiki.title

     authorize @wiki
     if @wiki.destroy
       flash[:notice] = "\"#{title}\" was deleted successfully."
       redirect_to wikis_path
     else
       flash[:error] = "There was an error deleting the topic."
       render :show
     end
   end

     private

  def wiki_params
    params.require(:wiki).permit(:title, :private, :body, :user_ids => [])
  end
end
