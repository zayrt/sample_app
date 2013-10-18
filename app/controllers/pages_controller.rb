class PagesController < ApplicationController
  def home
    @titre = "Accueil"
    if signed_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end
  
  def contact
    @titre = "Contact"
  end

  def about
    @titre = "A propos"
  end
  
  def help
    @titre = "Aide"
  end
end
