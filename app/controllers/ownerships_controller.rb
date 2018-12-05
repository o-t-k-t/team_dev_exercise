class OwnershipsController < ApplicationController
  def update
    team = Team.friendly.find(params[:team_id])
    new_owner = User.find(params[:user_id])

    team.change_leader(new_owner)

    redirect_to team, notice: 'リーダー権限を移しました'
  end
end
