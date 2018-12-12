module AssignHelper
  def deletable_asign?(assign)
    assign.team.owner == current_user || assign.user == current_user
  end
end
