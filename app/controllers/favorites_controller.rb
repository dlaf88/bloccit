class FavoritesController < ApplicationController
   def create
     @post = Post.find(params[:post_id])
     favorite = current_user.favorites.build(post: @post)
     authorize favorite
     if favorite.save
       flash[:notice] = "Favorited post"
       redirect_to [@post.topic, @post]
     else
       flash[:error] = "Unable to add favorite. Please try again."
      mredirect_to [@post.topic, @post]
       
     end
   end
  
   def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.find(params[:id])
    
    authorize favorite
    if favorite.destroy
      # Flash success and redirect to @post      
      flash[:notice] = "This post has been removed from your Favorites."
      redirect_to [@post.topic, @post]
    else
      flash[:notice] = "There was an error while unfavoriting this post. Try again later."
      redirect_to [@post.topic, @post]    
    end
 end
  
  
  
  
  
  
  
end


