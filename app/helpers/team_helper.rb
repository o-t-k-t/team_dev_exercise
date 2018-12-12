module TeamHelper
  def default_img(image)
    image.presence || 'default.jpg'
  end

  def editable_team?(team)
    team.owner == current_user
  end
end
