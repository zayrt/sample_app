module ApplicationHelper
  def titre
    base_titre = "Sample app "
    if @titre.nil?
      base_titre
    else
      "#{base_titre} | #{@titre}"
    end
  end

  def pseudo
    base_pseudo = "Welcome"
    if @pseudo.nil?
      base_pseudo
    else
      "#{base_pseudo} : #{@pseudo}"
    end
  end
end
