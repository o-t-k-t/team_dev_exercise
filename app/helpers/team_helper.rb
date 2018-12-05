module TeamHelper
  def default_img(image)
    image.presence || 'default.jpg'
  end

  def can_delegate_ownership?(user, team)
    user == team.owner
  end
end
