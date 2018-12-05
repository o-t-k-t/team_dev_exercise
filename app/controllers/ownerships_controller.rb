class OwnershipsController < ApplicationController
  def update
    team = Team.friendly.find(params[:team_id])
    owner = User.find(params[:user_id])
    team.update!(owner_id: owner.id)

    redirect_to team, notice: 'リーダー権限を移しました'
  end
end
