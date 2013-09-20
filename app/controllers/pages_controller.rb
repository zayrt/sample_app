class PagesController < ApplicationController
  def home
    @link = "about.html"
    @titre = "Accueil"
  end

  def contact
    @link = "home.html"
    @titre = "Contact"
  end

  def about
    @link = "contact.html"
    @titre = "A propos"
  end

end
