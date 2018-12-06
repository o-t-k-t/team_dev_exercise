module TeamHelper
  def default_img(image)
    image.presence || 'default.jpg'
  end

  def can_delegate_ownership?(delegater, team, delegatee)
    delegater == team.owner && delegatee != team.owner
  end

  def deletable_agenda?(agenda)
    current_user == agenda.user || current_user == agenda.team.owner
  end
end
