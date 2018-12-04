module TeamHelper
  def default_img(image)
    image.presence || 'default.jpg'
  end

  def deletable_asign?(assign)
    assign.team.owner == current_user || assign.user == current_user
  end

  def editable_team?(team)
    team.owner == current_user
  end
end
