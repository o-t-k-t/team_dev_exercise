class OwnershipsController < ApplicationController
  include TeamHelper

  def update
    team = Team.friendly.find(params[:team_id])
    new_owner = User.find(params[:user_id])

    if can_delegate_ownership?(current_user, team, new_owner)
      team.change_leader(new_owner)
      redirect_to team, notice: 'リーダー権限を移しました'
    else
      redirect_to team, notice: '現在のリーダー以外、リーダーを変更できません'
    end
  end
end
